import 'package:flutter/material.dart';
import 'package:super_cinema/core/shared/widgets/footer_details.dart';
import 'package:super_cinema/core/utils/constans.dart';
import 'package:super_cinema/features/buy/widgets/image_body.dart';
import 'package:super_cinema/features/buy/widgets/list_date.dart';
import 'package:super_cinema/features/buy/widgets/list_time.dart';
import 'package:super_cinema/features/buy/widgets/selected_chair.dart';
import 'package:super_cinema/features/buy/widgets/spacer_container.dart';
import 'package:super_cinema/features/home/presentation/widgets/home_header.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperCinemaColors.blue,
      body: Column(
        children: [
          const HomeHeader(),
          const BuyBody(),
          FooterDetails(isBuy: true, onTap: () => Navigator.pop(context))
        ],
      ),
    );
  }
}

class BuyBody extends StatelessWidget {
  const BuyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: const [
        ImageBody(),
        ListDate(),
        SizedBox(
          height: 20,
        ),
        ListTime(),
        SpacerContainer(),
        SizedBox(height: 20),
        SelectedChair()
      ],
    ));
  }
}
