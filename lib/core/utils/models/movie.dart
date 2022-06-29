class Movie {
  final String title;
  final String subtitle;
  final String poster;
  final String image;
  final String authors;
  final List<String> hora;
  final int anio;
  final String gender;

  Movie({
    required this.title,
    required this.subtitle,
    required this.poster,
    required this.image,
    required this.authors,
    required this.hora,
    required this.anio,
    required this.gender,
  });
}

final movies = <Movie>[
  Movie(
    title: "Charlie'S Angels",
    subtitle: 'Clean energy',
    poster: 'assets/supercinema/charlies-poster.png',
    image: 'assets/supercinema/charlies.png',
    authors: 'Kristen Stewart, Naomi Scott, Elizabeth',
    hora: ['17:25', '19:55', '20:45', '22:50'],
    anio: 2019,
    gender: 'Acción, Comedia',
  ),
  Movie(
    title: 'Avenger End Game',
    subtitle: 'End Game',
    poster: 'assets/supercinema/avenger-poster.png',
    image: 'assets/supercinema/avenger.png',
    authors: 'Robert Jr, Chris Evans, Paul Rudd',
    hora: ['14:30', '16:36', '17:25', '21:25', '22:10'],
    anio: 2019,
    gender: 'Acción, Ciencia ficción',
  ),
  Movie(
    title: 'Jumanji',
    subtitle: 'The Next Level',
    poster: 'assets/supercinema/jumanji-poster.png',
    image: 'assets/supercinema/jumanji.png',
    authors: 'Dwayne Johnson, Jack Black, Karen Gillian',
    hora: ['16:15', '17:45', '19:45', '21:00', '22:40'],
    anio: 2019,
    gender: 'Adventure, Games, Travelers',
  ),
  Movie(
    title: "Start Wars",
    subtitle: 'Episodio IX',
    poster: 'assets/supercinema/star-wars-poster.png',
    image: 'assets/supercinema/star-wars.png',
    authors: 'Daisy Ridley, John Boyega, Oscar Isaac',
    hora: ['13:55', '16:40', '18:20', '20:15', '21:25'],
    anio: 2018,
    gender: 'Ciencia ficción, Acción',
  ),
  Movie(
    title: "Joker",
    subtitle: 'Guasón',
    poster: 'assets/supercinema/joker-poster.png',
    image: 'assets/supercinema/joker.png',
    authors: 'Joaquin Phoenix, Zazie Beetz,Brett Cullen',
    hora: ['15:30', '16:20', '17:25', '19:55', '22:20'],
    anio: 2019,
    gender: 'Crimen, Drama',
  ),
];
