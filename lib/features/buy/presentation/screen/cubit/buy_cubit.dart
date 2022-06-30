import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyState.initialState);

  void selectDate(int value) {
    emit(state.copyWith(value: value, time: state.time));
  }

  void selectTime(int time) {
    emit(state.copyWith(time: time, value: state.value));
  }
}
