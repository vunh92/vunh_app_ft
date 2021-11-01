import 'package:http/http.dart' as http;
import 'package:vunh_movies/discover/data/movies_strings.dart';

class TopListsApi {
  final String api_server = 'https://api.themoviedb.org/3/discover/movie';

  Future<http.Response> getTopListsList() async {
    final header = getHeader();
    String url =
        api_server + MoviesStrings.apiKey;
    return http.get(url, headers: header);
  }

  Map<String, String> getHeader() {
    return ({
      'Content-Type': 'application/json',
    });
  }
}