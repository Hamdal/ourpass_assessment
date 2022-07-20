import 'package:flutter/material.dart';

class FillWidthButton extends StatelessWidget {
  final Function? onPressed;
  final String text;
  final bool isLoading;
  final double fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;
  final double? elevation;
  final Color? textColor;
  final double? verticalPadding;
  
  const FillWidthButton({ 
    Key? key,
    this.isLoading = false,
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
            const Color(0xFF0184D6).withOpacity(isLoading ? 0.6 : 1), 
            const Color(0xFF004067).withOpacity(isLoading ? 0.6 : 1)
          ]
        ),
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: MaterialButton(
        onPressed: isLoading || onPressed == null ? null : () => onPressed!(),
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
              visible: isLoading,
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