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
  final ValueNotifier<int> _page = ValueNotifier(1);

  PageController get pageController => _controller;
  ValueNotifier<int> get selected => _page;

  void init() {
    _controller = PageController(initialPage: 1, viewportFraction: .5);
  }

  void _onCahngeIndex(OnChangeIndex event, Emitter<HomeState> emit) {
    _page.value = event.index!;
    emit(state.copyWith(index: event.index!, value: _controller.page));
  }

  @override
  Future<void> close() {
    _controller.dispose();

    return super.close();
  }
}
