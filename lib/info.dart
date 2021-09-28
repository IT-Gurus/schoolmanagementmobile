class info {
  late final String directors;

  late final String release_date;
  late final double rating;
  late final String genres;

  late final String image_url;
  late final String plot;
  late final int rank;
  late final int running_time_secs;
  //    final actors[];
  //   info({
  //     required this.directors,
  //   })

}



//CODE FOR CALLING FUTURE MOVIE API 
/*
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
*/
