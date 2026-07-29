abstract class CounterState {}

class CounterValueChanged extends CounterState {
  final int counterValue;

  CounterValueChanged({required this.counterValue});
}

class InitCounter extends CounterState {}
