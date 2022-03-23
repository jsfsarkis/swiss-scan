import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_scan/ui/screens/generate_qr_screen.dart';
import 'package:swiss_scan/ui/screens/scan_qr_screen.dart';

import '../theme/app_colors.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with TickerProviderStateMixin {
  int currentIndex = 0;

  final screens = const [
    ScanQrScreen(),
    GenerateQrScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: _buildBottomNavBar(context),
      body: screens[currentIndex],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 80, right: 80),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(500)),
        color: AppColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              if (currentIndex == 0) {
                return;
              } else {
                currentIndex = 0;
                setState(() {});
              }
            },
            icon: const FaIcon(
              FontAwesomeIcons.camera,
              size: 35,
              color: AppColors.accentColor2,
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              if (currentIndex == 1) {
                return;
              } else {
                currentIndex = 1;
                setState(() {});
              }
            },
            icon: const FaIcon(
              FontAwesomeIcons.qrcode,
              size: 35,
              color: AppColors.accentColor2,
            ),
          )
        ],
      ),
    );
  }
}
