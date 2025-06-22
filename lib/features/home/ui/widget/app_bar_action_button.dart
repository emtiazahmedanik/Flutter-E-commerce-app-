import 'package:flutter/material.dart';

class buildNavButton extends StatelessWidget {
  const buildNavButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(iconData),
        color: Colors.grey,
      ),
    );
  }
}
