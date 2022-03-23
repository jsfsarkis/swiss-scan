import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:swiss_scan/cubits/url_launcher/url_launcher_cubit.dart';
import 'package:swiss_scan/cubits/validate_code_cubit/validate_code_cubit.dart';
import 'package:swiss_scan/ui/widgets/screen_header.dart';

import '../theme/app_colors.dart';
import '../widgets/custom_alert_dialog.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? codeText;

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocListener<ValidateCodeCubit, ValidateCodeState>(
          listener: (context, state) {
            if (state is ValidateCodeURL) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(
                    title: state.barcode.code.toString(),
                    content: 'Do you want to visit this link?',
                    onOkTap: () {
                      context.read<UrlLauncherCubit>().launchURL(state.barcode.code!);
                    },
                  );
                },
              );
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildScreenHeader(context),
              _buildQrView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenHeader(BuildContext context) {
    return const Positioned(
      top: 15,
      child: ScreenHeader(
        text: 'Scan',
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70, bottom: 120, left: 30, right: 30),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderRadius: 40,
            borderColor: AppColors.primaryColor,
            borderLength: 50,
            borderWidth: 5,
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((Barcode barcode) {
      setState(() {
        codeText = barcode.code;
      });
      context.read<ValidateCodeCubit>().validateCode(barcode);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
