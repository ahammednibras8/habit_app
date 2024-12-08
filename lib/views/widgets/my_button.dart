import 'package:flutter/material.dart';
import 'package:mindful_habit_builder_app/core/utils/app_colors.dart';
import 'package:mindful_habit_builder_app/core/utils/app_fonts.dart';

class MyButton extends StatelessWidget {
  final double? height;
  final IconData? icon;
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  const MyButton({
    super.key,
    this.height = 56.0,
    this.icon,
    this.text,
    this.onPressed,
    this.color = AppColors.white,
    this.textColor,
    this.fontSize,
    this.iconSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultFontSize = screenWidth < 360 ? 12.0 : 13.0;
    final defaultIconSize = screenWidth < 360 ? 15.0 : 16.0;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.black100.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onPressed,
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: screenWidth < 360 ? 6 : 8,
                  vertical: 4,
                ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: textColor ?? AppColors.black100,
                        size: iconSize ?? defaultIconSize,
                      ),
                      SizedBox(width: screenWidth < 360 ? 4 : 6),
                    ],
                    if (text != null)
                      Flexible(
                        child: Text(
                          text!,
                          style: AppFonts.alternativeBook.copyWith(
                            color: textColor ?? AppColors.black100,
                            fontSize: fontSize ?? defaultFontSize,
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
