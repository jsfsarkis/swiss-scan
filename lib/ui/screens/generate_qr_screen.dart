import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:swiss_scan/cubits/url_launcher/url_launcher_cubit.dart';
import 'package:swiss_scan/ui/widgets/screen_header.dart';

import '../theme/app_colors.dart';

class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({Key? key}) : super(key: key);

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Stack(
            children: [
              _buildTextField(context),
              _buildQrImage(context),
              _buildScreenHeader(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenHeader(BuildContext context) {
    return Positioned(
      top: 15,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          context.read<UrlLauncherCubit>().launchURL('www.google.com');
        },
        child: const ScreenHeader(
          text: 'Generate a QR',
        ),
      ),
    );
  }

  Widget _buildQrImage(BuildContext context) {
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: QrImage(
          data: textEditingController.text.isEmpty ? 'Made with Flutter with love.' : textEditingController.text,
          foregroundColor: AppColors.accentColor2,
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Positioned(
      bottom: 75,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          border: Border.all(color: AppColors.accentColor),
        ),
        child: TextField(
          cursorColor: AppColors.accentColor,
          keyboardType: TextInputType.text,
          controller: textEditingController,
          onChanged: (value) {
            setState(() {});
          },
          style: const TextStyle(
            fontSize: 23,
            color: AppColors.accentColor2,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
