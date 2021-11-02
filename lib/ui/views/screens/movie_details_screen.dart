import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_popular_movies/data/enums/status.dart';

import '../../../configs/strings.dart';
import '../../../data/models/movie.dart';
import '../../../configs/globals.dart';
import '../../../configs/colors.dart';
import '../../../utils/formatters.dart';
import '../../../di/service_locators.dart';
import '../../../ui/viewmodels/movies_view_model.dart';
import '../../../ui/views/components/movie_details_backdrop.dart';
import '../../../ui/views/components/movie_poster.dart';
import '../../../ui/views/components/movie_data_container.dart';
import '../../../ui/views/components/movie_vote_average.dart';
import '../../../utils/hex_color.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({
    @required this.movie,
  });

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MoviesViewModel _viewModel = serviceLocator<MoviesViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchMovie(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    //var movie = ModalRoute.of(context).settings.arguments as Movie;
    var size = MediaQuery.of(context).size;
    var posterTag = 'poster_${widget.movie.id}';
    var titleTag = 'title_${widget.movie.id}';
    var imageUrl = "${Globals.IMAGE_URL}${widget.movie.posterPath}";

    var appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(Strings.detailsTitle),
      brightness: Brightness.dark,
    );

    var body = Column(
      children: [
        Stack(
          children: [
            MovieDetailsBackdrop(
              height: size.height * 0.4,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            MovieDataContainer(
              width: size.width,
              height: 260,
              margin: EdgeInsets.fromLTRB(
                8,
                size.width * 0.3,
                8,
                0,
              ),
            ),
            Positioned(
              top: size.height * 0.11,
              right: size.width * 0.04,
              child: MovieVoteAverage(
                color: HexColor.fromHex('#E0C01A'),
                average: widget.movie.voteAverage,
              ),
            ),
            Positioned(
              top: size.height * 0.11,
              left: size.width * 0.04,
              child: Row(
                children: [
                  MoviePoster(
                    height: 180,
                    heroTag: posterTag,
                    child: Image.network(imageUrl),
                  ),
                  Container(
                    width: size.width * 0.5,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Hero(
                          tag: titleTag,
                          child: Text(
                            widget.movie.title,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.movie.releaseDate.toYearFormat(),
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Observer(builder: (_) => _buildDetails()),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: body,
    );
  }

  Widget _buildDetails() {
    switch (_viewModel.status) {
      case Status.LOADING:
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
          ),
        );
      case Status.ERROR:
        return Center(child: Text(_viewModel.exception.toString()));
      case Status.SUCCESS:
        var fetchedMovie = _viewModel.movie;

        return Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 12),
              Text(
                _viewModel.genres,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: AppColors.accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              SizedBox(height: 12),
              Text(
                Strings.synopsis,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              SizedBox(height: 6),
              Text(
                fetchedMovie.overview,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.grey[400],
                      fontSize: 14,
                      height: 1.4,
                    ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
