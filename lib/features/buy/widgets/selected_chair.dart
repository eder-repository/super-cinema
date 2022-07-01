import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cinema/core/utils/constans.dart';
import 'package:super_cinema/features/buy/presentation/screen/cubit/buy_cubit.dart';

class SelectedChair extends StatelessWidget {
  const SelectedChair({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pos = 3;
    int space = 5;
    int aux = 0;
    final buyCubit = context.read<BuyCubit>();
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 45, right: 0, top: 15),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9,
              crossAxisSpacing: 12,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: chairsList.length,
          itemBuilder: (_, index) {
            if (index == space) {
              space += 9;
              return const IgnorePointer(child: SizedBox.shrink());
            } else {
              double translateX = 0.0;
              Color color = SuperCinemaColors.yellow;
              if (pos < index) {
                if (aux <= 3 && aux > 0) {
                  translateX = -25.0;
                  color = SuperCinemaColors.colorChair;
                }
                if (aux == 3) {
                  pos += 9;
                  aux = 0;
                } else {
                  aux++;
                }
              }
              return BlocSelector<BuyCubit, BuyState, int?>(
                selector: (state) => state.chair,
                builder: (context, chair) {
                  return Transform.translate(
                    transformHitTests: false,
                    offset: Offset(translateX, 0),
                    child: GestureDetector(
                      onTap: (chairsList[index] || chair == index)
                          ? null
                          : () => buyCubit.selectChair(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: (chairsList[index] || chair == index)
                              ? color
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    ));
  }
}
