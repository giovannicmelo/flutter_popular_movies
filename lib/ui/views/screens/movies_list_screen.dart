import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/enums/status.dart';
import '../../../di/service_locators.dart';
import '../../../ui/viewmodels/movies_view_model.dart';
import '../../../configs/strings.dart';
import '../../../ui/views/components/movie_list_tile.dart';

class MoviesListScreen extends StatefulWidget {
  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen>
    with SingleTickerProviderStateMixin {
  final MoviesViewModel _viewModel = serviceLocator<MoviesViewModel>();

  ScrollController _scrollController;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: kThemeAnimationDuration,
      value: 1,
      vsync: this,
    );

    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          _animationController.forward();
          break;
        case ScrollDirection.reverse:
          _animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
    _viewModel.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var searchButton = IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    );

    var appBar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(Strings.appTitle),
      actions: [searchButton],
    );

    var body = SafeArea(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(18),
        child: Observer(
          builder: (ctx) => RefreshIndicator(
            onRefresh: _viewModel.fetchPopularMovies,
            color: Theme.of(context).accentColor,
            child: _loadMovies(ctx),
          ),
        ),
      ),
    );

    var fabButton = FadeTransition(
      opacity: _animationController,
      child: ScaleTransition(
        scale: _animationController,
        child: Container(
          margin: EdgeInsets.only(bottom: 25),
          child: FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            },
            child: Icon(Icons.arrow_upward),
            elevation: 10,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: fabButton,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _loadMovies(BuildContext context) {
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
        var movies = _viewModel.paginatedMovies;
        return Observer(
          builder: (_) => ListView.separated(
            controller: _scrollController,
            itemCount: movies.length + 1,
            itemBuilder: (context, index) {
              if (index < movies.length) {
                return MovieListTile(movies[index]);
              } else if (index > 1) {
                _viewModel.fetchPopularMovies(page: _viewModel.movies.page + 1);
                return Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor),
                  ),
                );
              } else {
                return Container();
              }
            },
            separatorBuilder: (ctx, count) => Divider(
              color: Colors.grey[600],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
