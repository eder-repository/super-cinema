import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:super_cinema/core/utils/constans.dart';
import 'package:super_cinema/features/buy/presentation/screen/cubit/buy_cubit.dart';

class ListDate extends StatelessWidget {
  const ListDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final day = DateTime.now();
    final buyCubit = context.read<BuyCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(
          aspectRatio: 16 / 3.65,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: SuperCinemaColors.blueBlack),
            child: BlocSelector<BuyCubit, BuyState, int?>(
              selector: (state) => state.value,
              builder: (context, value) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  padding: const EdgeInsets.only(left: 15),
                  itemBuilder: (_, index) {
                    final date = day.add(Duration(days: index));
                    return GestureDetector(
                      onTap: () {
                        buyCubit.selectDate(index);
                      },
                      child: ItemDate(
                          isSelected: value == index,
                          text: DateFormat('dd').format(date),
                          text2: DateFormat('E').format(date)),
                    );
                  },
                );
              },
            ),
          )),
    );
  }
}

class ItemDate extends StatelessWidget {
  const ItemDate(
      {Key? key,
      this.isSelected = false,
      required this.text,
      required this.text2})
      : super(key: key);
  final bool isSelected;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelected ? SuperCinemaColors.yellow : SuperCinemaColors.gradient,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            text2.substring(0, 2).toUpperCase(),
            style: Theme.of(context).textTheme.button!.copyWith(
                color: isSelected ? Colors.black54 : Colors.white38,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
