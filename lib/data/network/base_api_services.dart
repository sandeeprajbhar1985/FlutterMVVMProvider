abstract class BaseApiServices {
  Future<dynamic> getGETApiResponse(String url);
  Future<dynamic> getPOSTApiResponse(String url, dynamic data);
}
