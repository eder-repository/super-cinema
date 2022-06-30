import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cinema/core/utils/constans.dart';
import 'package:super_cinema/core/utils/models/movie.dart';
import 'package:super_cinema/features/buy/presentation/screen/cubit/buy_cubit.dart';
import 'package:super_cinema/features/home/presentation/bloc/home_bloc.dart';

class ListTime extends StatelessWidget {
  const ListTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buyCubit = context.read<BuyCubit>();
    final movieBloc = context.read<HomeBloc>();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: AspectRatio(
            aspectRatio: 16 / 2.5,
            child: BlocSelector<BuyCubit, BuyState, int?>(
              selector: (state) => state.time,
              builder: (context, value) => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies[movieBloc.selected.value].hora.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => buyCubit.selectTime(index),
                        child: ItemTime(
                            time: movies[movieBloc.selected.value].hora[index],
                            isSelected: value == index),
                      )),
            )));
  }
}

class ItemTime extends StatelessWidget {
  const ItemTime({Key? key, required this.time, required this.isSelected})
      : super(key: key);

  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    print(isSelected);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isSelected ? SuperCinemaColors.yellow : Colors.grey,
            width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: isSelected ? SuperCinemaColors.yellow : Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'FROM \$3,75',
            style: Theme.of(context).textTheme.button!.copyWith(
                color: isSelected
                    ? SuperCinemaColors.yellow.withOpacity(.5)
                    : Colors.grey,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
