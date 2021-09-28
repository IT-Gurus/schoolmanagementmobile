import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Movie.dart';

class MovieApi extends StatefulWidget {
  const MovieApi({ Key? key }) : super(key: key);

  @override
  _MovieApiState createState() => _MovieApiState();
}

class _MovieApiState extends State<MovieApi> {
 static const BaseAPI = 'http://localhost:8083/api/v1/courses';
  late Future<Movie> futureMovie;

  Future<Movie> fetchMovieById(int movieId) async {
    final response =
        await http.get(Uri.parse(BaseAPI + "/" + movieId.toString()));

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Movie>> fetchAllMovies() async {
    final response = http.get(Uri.parse(BaseAPI + '/courses/allcourses'));
    return await response.then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final movies = <Movie>[];
        for (var movie in jsonData) {
          movies.add(Movie.fromJson(movie));
        }
        return movies;
      } else {
        throw Exception("Failed to Load movies");
      }
    });
  }

    @override
  void initState() {
    super.initState();
    futureMovie = fetchMovieById(1);
  }

  // Call the fetchAlbum() method in either the initState() or didChangeDependencies() methods.

// The initState() method is called exactly once and then never again. If you want to have the option of reloading the API in response to an InheritedWidget changing, put the call into the didChangeDependencies() method. See State for more details.

  /* @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureMovie = fetchMovieById(2);
  }
  */



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Movie>(
          future: futureMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                Card(
                  color: Colors.blue,
                  margin: EdgeInsets.all(10.0),
                  elevation: 15,
                  child: Text(
                    snapshot.data!.year,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  snapshot.data!.title,
                  style: TextStyle(fontStyle: FontStyle.normal),
                ),
                //  Image.network('/images/laptop.jpg',fit: ,)
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
         ),
    );
  }
}
