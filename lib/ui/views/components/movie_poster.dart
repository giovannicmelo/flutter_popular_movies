import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final Widget child;
  final double height;
  final String heroTag;

  const MoviePoster({
    required this.child,
    required this.height,
    this.heroTag = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: heroTag,
          child: Container(
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
