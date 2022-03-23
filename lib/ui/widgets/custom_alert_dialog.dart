import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkTap;
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onOkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      actions: [
        _buildButton(
          context,
          text: 'Cancel',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 20),
        _buildButton(
          context,
          text: 'OK',
          onTap: onOkTap,
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
