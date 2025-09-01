import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.ontap,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
          onPressed: ontap,
          icon: Icon(
            icon,
            size: 60,
            color: AppColors.kIconColor,
          )),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title.toUpperCase(),
          style: AppStyles.headline_text(),
        ),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          subtitle,
          style: AppStyles.subtitle_text(size: 14),
        ),
      ),
    );
  }
}
