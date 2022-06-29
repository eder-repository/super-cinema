import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initialState) {
    on<OnChangeIndex>(_onCahngeIndex);
  }
  late PageController _controller;
  final ValueNotifier<double> _page = ValueNotifier(1.0);

  PageController get pageController => _controller;
  double get value => _page.value;

  void init() {
    _controller = PageController(initialPage: 3, viewportFraction: .5);
  }

  void _onCahngeIndex(OnChangeIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index!, value: _controller.page));
  }

  @override
  Future<void> close() {
    _controller.dispose();

    return super.close();
  }
}
