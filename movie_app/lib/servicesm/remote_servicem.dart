import '../Constants/popularmovies.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<Result>?> getMovies() async {
    var client = http.Client();
    
    var uri = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff");
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return moviesFromJson(json).results;
    }
    return null;
  }

}