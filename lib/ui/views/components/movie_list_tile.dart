import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../data/models/movie.dart';
import '../../../configs/colors.dart';
import '../../../configs/globals.dart';
import '../../../configs/routes.dart';
import '../../../utils/formatters.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;

  const MovieListTile(this.movie);

  @override
  Widget build(BuildContext context) {
    var posterTag = 'poster_${movie.id}';
    var titleTag = 'title_${movie.id}';
    var poster = Expanded(
      flex: 1,
      child: Hero(
        tag: posterTag,
        child: Container(
          padding: EdgeInsets.only(right: 12),
          height: 120,
          child: FadeInImage.memoryNetwork(
            //placeholder: 'assets/images/loading.gif',
            placeholder: kTransparentImage,
            image: "${Globals.IMAGE_URL}${movie.posterPath}",
          ),
        ),
      ),
    );

    var dataContainer = Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: titleTag,
              child: Text(
                '${movie.title} (${movie.releaseDate.toYearFormat()})',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
            Text(
              '(${movie.originalTitle})',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: AppColors.accentColor, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              movie.overview,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontSize: 14),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.details,
          arguments: movie,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            poster,
            dataContainer,
          ],
        ),
      ),
    );
  }
}
