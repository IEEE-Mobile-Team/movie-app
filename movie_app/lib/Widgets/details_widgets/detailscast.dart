import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Constants/app_consts.dart';
import '../../Constants/details.dart';

var baseURL = 'https://image.tmdb.org/t/p/w500';

class DetailsCast extends StatefulWidget {
  const DetailsCast({super.key, required this.id, required this.type});

  final int id;
  final String type;

  @override
  State<DetailsCast> createState() => _DetailsCastState(id, type);
}

class _DetailsCastState extends State<DetailsCast> {
  late final int id;
  late final String type;
  _DetailsCastState(this.id, this.type);
  @override
  void initState() {
    super.initState();
    recieve();
  }

  recieve() async {
    details = await fetchData();
    if (details != null) {
      setState(() {
        detailsLoaded = true;
      });
    }
  }

  Future<List<Result>?> fetchData() async {
    var client = http.Client();
    var uri;
    if (type == "movie") {
      uri = Uri.parse(
          "https://api.themoviedb.org/3/movie/$id/credits?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff&language=en-US");
    } else {
      uri = Uri.parse(
          "https://api.themoviedb.org/3/tv/$id/credits?api_key=bdd10d2b8f52bc0a5320d5c9d88bd1ff&language=en-US");
    }
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return detailsFromJson(response.body).results;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cast",
          style: TextStyle(
              fontSize: 24, color: txt_color, fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 15,
        ),
        Visibility(
          visible: detailsLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: SizedBox(
            height: 375,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(baseURL + details![index].path),
                        )),
                    Spacer(),
                    SizedBox(
                        width: 200,
                        child: Text(
                          details![index].name,
                          style: TextStyle(
                              fontSize: 18,
                              color: txt_color,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        )),
                    Spacer(),
                    SizedBox(
                        width: 200,
                        child: Text(
                          details![index].character,
                          style: TextStyle(fontSize: 18, color: txt_color),
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
