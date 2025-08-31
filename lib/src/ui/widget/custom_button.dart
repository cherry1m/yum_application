import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color? backgroundColor; // 배경색 파라미터
  final Color? textColor; // 글자색 파라미터
  final TextStyle? textStyle; // 추가 텍스트 스타일
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.onPressed,
    this.height = 50,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFF97316),
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
