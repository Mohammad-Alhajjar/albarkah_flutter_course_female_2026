class CounterState {}

class CounterHasIncreamented extends CounterState {
  final int newValueOfCounterafterAdding;

  CounterHasIncreamented({required this.newValueOfCounterafterAdding});
}

class CounterHasDecreamented extends CounterState {
  final int newValueOfCounterafterSub;

  CounterHasDecreamented({required this.newValueOfCounterafterSub});
}

class CounterHasReset extends CounterState {}

class InitCounter extends CounterState {}
