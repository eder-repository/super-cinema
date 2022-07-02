import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_cinema/core/navigation/routes.dart';
import 'package:super_cinema/core/shared/widgets/footer_details.dart';
import 'package:super_cinema/core/shared/widgets/rounded_button.dart';
import 'package:super_cinema/core/utils/constans.dart';
import 'package:super_cinema/core/utils/models/movie.dart';
import 'package:super_cinema/features/home/presentation/bloc/home_bloc.dart';
import 'package:super_cinema/features/home/presentation/widgets/image_background.dart';
import 'package:super_cinema/features/home/presentation/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ImageBackgroundWidgets(),
        Scaffold(
            backgroundColor: SuperCinemaColors.background.withOpacity(.7),
            body: Column(
              children: const [HomeHeader(), HomeBody(), FooterDetails()],
            ))
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: const [Detail(), Movies()],
    ));
  }
}

class Movies extends StatelessWidget {
  const Movies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieCubit = context.read<HomeBloc>();
    return Expanded(
      flex: 3,
      child: BlocSelector<HomeBloc, HomeState, double>(
        selector: (state) {
          return state.value ?? 0.0;
        },
        builder: (context, state) {
          return LayoutBuilder(
            builder: (_, constrains) {
              return PageView.builder(
                itemCount: movies.length,
                controller: movieCubit.pageController,
                onPageChanged: (page) =>
                    movieCubit.add(OnChangeIndex(index: page)),
                itemBuilder: (_, i) {
                  final paddingHorizontal = constrains.maxWidth * .04;
                  final paddingTop = lerpDouble(0, 1, (i - state).abs());
                  return Padding(
                    padding: EdgeInsets.only(
                      left: paddingHorizontal,
                      right: paddingHorizontal,
                      top: constrains.maxHeight * (.2 * paddingTop!),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Hero(
                          tag: movies[i].image,
                          child: Image.asset(
                            movies[i].image,
                          )),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _TrailerAbout(),
                  const _TitleSubtitle(),
                  const _AnioGender(),
                  RoundedButton(
                      text: 'Buy Tickets',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.buy)),
                  const Authors()
                ],
              ),
            ],
          ),
        ));
  }
}

class _TrailerAbout extends StatelessWidget {
  const _TrailerAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w800, color: SuperCinemaColors.yellow),
            children: [
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset('assets/supercinema/play.svg'))),
              TextSpan(text: 'View Trailer'.toUpperCase()),
              const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child:
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15))),
              TextSpan(text: 'About Movie'.toUpperCase()),
            ]),
      ),
    );
  }
}

class _TitleSubtitle extends StatelessWidget {
  const _TitleSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.index,
      builder: (_, index) {
        final movie = movies[index];
        return Text(
          '${movie.title.toUpperCase()}:\n${movie.subtitle.toUpperCase()}',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

class _AnioGender extends StatelessWidget {
  const _AnioGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.index,
      builder: (_, index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              text: '${movie.anio}',
              children: [
                const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                            radius: 3.5,
                            backgroundColor: SuperCinemaColors.yellow))),
                TextSpan(text: movie.gender),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Authors extends StatelessWidget {
  const Authors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.index,
      builder: (_, index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            movie.authors.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
