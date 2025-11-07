import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
    required this.title,
    required this.colors,
    required this.titleSize,
    required this.borderColor,
  });

  final String title;
  final List<Color> colors;
  final int titleSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // Give it some space to center inside
      size: Size(double.infinity, titleSize.sp * 1.4),
      painter: _GradientBorderTextPainter(
        text: title,
        colors: colors,
        fontSize: titleSize.sp,
        borderColor: borderColor,
        borderWidth: 3.w,
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

  _GradientBorderTextPainter({
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
          fontFamily: GoogleFonts.cinzelDecorative().fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
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
          fontFamily: GoogleFonts.cinzelDecorative().fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
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
