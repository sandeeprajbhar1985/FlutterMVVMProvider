import 'package:poc_mvvm_provider/res/app_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/movie_model.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGETApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
