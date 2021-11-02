import 'package:flutter/material.dart';

import '../../../configs/strings.dart';

class MovieVoteAverage extends StatelessWidget {
  final double average;
  final Color color;

  const MovieVoteAverage({@required this.average, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: 50,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              Strings.score,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: color != null ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
            ),
            Text(
              average.toString(),
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: color != null ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
