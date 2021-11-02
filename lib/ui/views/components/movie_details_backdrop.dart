import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetailsBackdrop extends StatelessWidget {
  final Widget child;
  final double height;

  const MovieDetailsBackdrop({
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: height,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child,
          ),
        ),
        Container(
          width: size.width,
          height: size.height * 0.42,
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
