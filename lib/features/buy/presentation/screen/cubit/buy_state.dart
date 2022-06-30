part of 'buy_cubit.dart';

class BuyState extends Equatable {
  const BuyState({this.value, this.time});

  final int? value;
  final int? time;

  static get initialState => const BuyState(value: 0, time: 0);

  BuyState copyWith({
    int? value,
    int? time,
  }) =>
      BuyState(value: value, time: time);

  @override
  List<int?> get props => [value, time];
}
