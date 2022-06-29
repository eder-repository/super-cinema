part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.index, this.value});

  final int index;
  final double? value;

  static get initialState => const HomeState(index: 0);

  HomeState copyWith({
    required int index,
    double? value,
  }) =>
      HomeState(index: index, value: value);

  @override
  List<Object?> get props => [index, value];
}
