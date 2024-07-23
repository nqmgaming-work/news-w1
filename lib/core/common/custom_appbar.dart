import 'package:first_pj/constants/font_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final List<Widget>? actionIcons;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.actionIcons,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: FontConstants.productSans,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(
                leadingIcon,
                size: 30,
              ),
              onPressed: () {
                // Navigator.of(context).pop();
              },
            )
          : null,
      actions: actionIcons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
