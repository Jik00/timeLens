import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget {
  const BackgroundTheme({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full screen image
        SizedBox.expand(
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),

        // Dark edges effect using gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5), // top darker
                Colors.transparent, // middle
                Colors.black.withOpacity(0.8), // bottom darker
              ],
            ),
          ),
        ),
      ],
    );
  }
}
