import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_cinema/core/utils/constans.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 4.5,
        child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  SuperCinemaColors.blueGray,
                  SuperCinemaColors.blueGray.withOpacity(.9),
                  SuperCinemaColors.blueGray.withOpacity(.75),
                  SuperCinemaColors.blueGray.withOpacity(.6),
                  SuperCinemaColors.blueGray.withOpacity(.55),
                  SuperCinemaColors.blueGray.withOpacity(.4),
                  SuperCinemaColors.blueGray.withOpacity(.25),
                  SuperCinemaColors.blue.withOpacity(.15),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/supercinema/menu.svg'),
                    SvgPicture.asset('assets/supercinema/logo.svg'),
                    ClipOval(
                        child: Image.asset('assets/supercinema/eder.jpg',
                            width: 40)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/supercinema/location.svg'),
                    const SizedBox(width: 10),
                    Text(
                      'CC. El Dorado',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            )));
  }
}
