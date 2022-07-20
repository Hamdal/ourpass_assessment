import 'package:flutter/material.dart';
import 'package:ourpass_assessment/config/constants.dart';

class FillWidthButton extends StatelessWidget {
  final Function? onPressed;
  final String text;
  final bool loading;
  final double fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;
  final double? elevation;
  final Color? textColor;
  final double? verticalPadding;
  
  const FillWidthButton({ 
    Key? key,
    this.loading = false,
    this.fontSize = 16,
    this.borderRadius = 8,
    this.fontWeight = FontWeight.w600,
    this.elevation,
    this.textColor = Colors.white,
    this.verticalPadding = 18,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLight.withOpacity(loading ? 0.6 : 1), 
            AppColors.primary.withOpacity(loading ? 0.6 : 1)
          ]
        ),
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: MaterialButton(
        onPressed: loading || onPressed == null ? null : () => onPressed!(),
        elevation: elevation ?? 0,
        hoverElevation: elevation ?? 0,
        enableFeedback: true,
        disabledColor: Colors.white.withOpacity(0.4),
        minWidth: double.infinity,
        focusElevation: elevation,
        highlightElevation: elevation ?? 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding!
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight!,
              ),
            ),
            // SizedBox(width: 48),
            Visibility(
              visible: loading,
              child: Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(left: 48),
                child: const CircularProgressIndicator.adaptive(
                  value: null,
                  backgroundColor: Colors.white,
                  strokeWidth: 3,
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}