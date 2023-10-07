import 'package:flutter/material.dart';
import '../model/movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final Results movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.title!),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  widget.movie.url!.toString(),
                  errorBuilder: (context, error, stack) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(widget.movie.title!),
                SizedBox(height: 16),
                Text(widget.movie.director!),
                SizedBox(height: 16),
                Text(widget.movie.releaseDate!),
              ],
            ),
          ],
        ));
  }
}
