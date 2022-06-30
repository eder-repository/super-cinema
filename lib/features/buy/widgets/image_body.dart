import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cinema/core/utils/models/movie.dart';
import 'package:super_cinema/features/home/presentation/bloc/home_bloc.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBloc = context.read<HomeBloc>();
    final movie = movies[movieBloc.selected.value];
    return AspectRatio(
      aspectRatio: 16 / 3.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: movie.image,
                child: Image.asset(
                  movie.image,
                  fit: BoxFit.cover,
                  width: 50,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text('${movie.title}:\n${movie.subtitle}'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
