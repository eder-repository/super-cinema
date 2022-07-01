import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyState.initialState);

  void selectDate(int value) {
    emit(state.copyWith(value: value, time: state.time, chair: state.chair));
  }

  void selectTime(int time) {
    emit(state.copyWith(time: time, value: state.value, chair: state.chair));
  }

  void selectChair(int chair) {
    emit(state.copyWith(time: state.time, value: state.value, chair: chair));
  }
}
