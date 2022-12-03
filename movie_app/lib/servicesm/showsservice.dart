import 'package:http/http.dart' as http;

import '../Constants/popularshows.dart';

class ShowService{
  Future<List<Result>?> getShows() async {
    var client = http.Client();

    var uri = Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff");
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return showsFromJson(json).results;
    }
    return null;
  }
}