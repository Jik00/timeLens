import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StrokeTextCizel extends StatelessWidget {
  const StrokeTextCizel({
    super.key,
    required this.title,
    required this.colors,
    required this.titleSize,
    required this.borderColor,
    this.textDecoration,
  });

  final String title;
  final List<Color> colors;
  final int titleSize;
  final Color borderColor;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        size: Size(double.infinity, titleSize.sp * 1.4),
        painter: _GradientBorderTextPainter(
          textDecoration,
          text: title,
          colors: colors,
          fontSize: titleSize.sp,
          borderColor: borderColor,
          borderWidth: 2.5,
        ),
      ),
    );
  }
}

class _GradientBorderTextPainter extends CustomPainter {
  final String text;
  final List<Color> colors;
  final double fontSize;
  final Color borderColor;
  final double borderWidth;
  final TextDecoration? textDecoration;

  _GradientBorderTextPainter(
    this.textDecoration, {
    required this.text,
    required this.colors,
    required this.fontSize,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for border
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..color = borderColor;

    // Prepare text painter (border)
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          letterSpacing: 2,
          fontFamily: GoogleFonts.cinzelDecorative().fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          foreground: borderPaint,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Calculate offset to center text
    final dx = (size.width - textPainter.width) / 2;
    final dy = (size.height - textPainter.height) / 2;
    final offset = Offset(dx, dy);

    // Draw border
    textPainter.paint(canvas, offset);

    // Gradient fill
    final shader = LinearGradient(
      colors: colors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Rect.fromLTWH(
      offset.dx,
      offset.dy,
      textPainter.width,
      textPainter.height,
    ));

    final fillPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          decoration: textDecoration,
          letterSpacing: 2,
          fontFamily: GoogleFonts.cinzelDecorative().fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          foreground: Paint()
            ..shader = shader
            ..style = PaintingStyle.fill,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Draw fill centered
    fillPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
