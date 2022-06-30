import 'package:flutter/material.dart';
import 'package:super_cinema/core/utils/constans.dart';

class SpacerContainer extends StatelessWidget {
  const SpacerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 12.5),
      child: AspectRatio(
        aspectRatio: 16 / 1.4,
        child: ClipPath(
          clipper: _Clipper(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 3, color: SuperCinemaColors.screen)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  SuperCinemaColors.screen.withOpacity(.45),
                  SuperCinemaColors.screen.withOpacity(.45),
                  SuperCinemaColors.screen.withOpacity(.25),
                  SuperCinemaColors.screen.withOpacity(.1),
                  SuperCinemaColors.screen.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width * .95, 0)
    ..lineTo(size.width * .05, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper != this;
}
