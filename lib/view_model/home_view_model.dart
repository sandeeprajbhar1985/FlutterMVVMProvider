import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import '../model/movie_model.dart';
import '../repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    if (moviesList.data == null) {
      setMoviesList(ApiResponse.loading());
      _myRepo.fetchMoviesList().then((value) {
        setMoviesList(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setMoviesList(ApiResponse.error(error.toString()));
      });
    }
  }
}
