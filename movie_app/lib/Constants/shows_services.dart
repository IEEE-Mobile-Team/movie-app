import 'package:movie_app/Constants/popular_shows.dart';
import 'package:http/http.dart' as http;

class ShowsServices{
  Future<PopularTv?> getPopShows() async{
    var client = http.Client();

    var uri = Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return popularTvFromJson(json);
    }
    return null;
  }
}