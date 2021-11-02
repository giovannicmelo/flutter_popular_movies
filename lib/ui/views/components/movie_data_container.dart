import 'package:flutter/material.dart';

class MovieDataContainer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const MovieDataContainer({
    required this.width,
    required this.height,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      margin: this.margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
