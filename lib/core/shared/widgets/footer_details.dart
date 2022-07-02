import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_cinema/core/shared/widgets/rounded_button.dart';

import '../../utils/constans.dart';

class FooterDetails extends StatelessWidget {
  const FooterDetails({Key? key, this.isBuy = false, this.onTap})
      : super(key: key);
  final bool isBuy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: isBuy ? 16 / 3.75 : 16 / 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              SuperCinemaColors.blueGray,
              SuperCinemaColors.blueGray,
              SuperCinemaColors.blueGray,
              SuperCinemaColors.blueGray.withOpacity(.9),
              SuperCinemaColors.blueGray.withOpacity(.8),
              SuperCinemaColors.blueGray.withOpacity(.7),
              SuperCinemaColors.blue.withOpacity(.5),
              SuperCinemaColors.blue.withOpacity(.3),
              SuperCinemaColors.blue.withOpacity(.1),
              SuperCinemaColors.blue.withOpacity(0),
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: isBuy
                  ? Text(
                      '\$3,75',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  : SvgPicture.asset('assets/supercinema/pop.svg'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SvgPicture.asset('assets/supercinema/arrow.svg'),
                ),
              ),
            ),
            if (isBuy)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: RoundedButton(onTap: () {}, text: 'PAY'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
