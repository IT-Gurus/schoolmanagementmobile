class Movie {
  final String year;
  final String title;


  Movie({required this.year, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(year: json['courseType'],
     title: json['courseName']
     );
  }
}
