import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cinema/core/utils/models/movie.dart';
import 'package:super_cinema/features/home/presentation/bloc/home_bloc.dart';

class ImageBackgroundWidgets extends StatefulWidget {
  const ImageBackgroundWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageBackgroundWidgets> createState() => _ImageBackgroundWidgetsState();
}

class _ImageBackgroundWidgetsState extends State<ImageBackgroundWidgets>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _move = -50.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return Positioned.fill(
            right: _move * (1 - _animationController.value),
            left: _move * _animationController.value,
            child: BlocSelector<HomeBloc, HomeState, int>(
              selector: (state) => state.index,
              builder: (_, index) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  key: Key(index.toString()),
                  child: Image.asset(movies[index].poster, fit: BoxFit.cover),
                ),
              ),
            ),
          );
        });
  }
}
