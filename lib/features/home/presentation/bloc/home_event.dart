part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class OnChangeIndex extends HomeEvent {
  const OnChangeIndex({
    this.index,
  });

  final int? index;
}
