import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ScreenHeader extends StatelessWidget {
  final String text;
  final Widget? iconButton;
  const ScreenHeader({
    Key? key,
    required this.text,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.accentColor2,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconButton != null
              ? iconButton!
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                    color: AppColors.accentColor2,
                  ),
                ),
        ],
      ),
    );
  }
}
