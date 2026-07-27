import 'package:bloc_example/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/blocs/counter_bloc/counter_event.dart';
import 'package:bloc_example/blocs/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Page"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list_alt_rounded),
                ),
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "1",
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreamentCounter());
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    context.read<CounterBloc>().add(DecreamentCounter());
                  },
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: "3",
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetCounter());
                  },
                  child: Icon(Icons.exposure_zero),
                ),
              ],
            ),
            body: Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterHasIncreamented) {
                    return Text(state.newValueOfCounterafterAdding.toString());
                  } else if (state is CounterHasDecreamented) {
                    return Text(state.newValueOfCounterafterSub.toString());
                  } else if (state is CounterHasReset) {
                    return Text("0");
                  } else {
                    return Text("0");
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
