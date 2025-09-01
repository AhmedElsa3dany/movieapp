import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:cleanarch/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kCardColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: AppStyles.card_text(),
        ),
      ),
    );
  }
}
