part of 'buy_cubit.dart';

class BuyState extends Equatable {
  const BuyState({
    this.value,
    this.time,
    this.chair,
  });

  final int? value;
  final int? time;
  final int? chair;

  static get initialState => const BuyState(value: 0, time: 0, chair: 0);

  BuyState copyWith({
    int? value,
    int? time,
    int? chair,
  }) =>
      BuyState(value: value, time: time, chair: chair);

  @override
  List<int?> get props => [value, time, chair];
}
