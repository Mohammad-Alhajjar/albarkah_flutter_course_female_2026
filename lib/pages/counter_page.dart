import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_session/providers/counter_provider.dart';

final staticTextDataProvider = Provider<String>((Ref ref) {
  return "String text";
});

final counterProvider = NotifierProvider<CounterNotifeirProvider, int>(() {
  return CounterNotifeirProvider();
});

// ! CounterPage class with ConsumerWidget (StatelessWidget with Riverpod)

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var providerData = ref.watch(staticTextDataProvider);
        var counter = ref.watch(counterProvider);

    // ! invalid use for counter value without state object    
    // var counter = ref.watch(counterProvider.notifier).counter;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
            },
            child: Icon(Icons.exposure_zero),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString(), style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            Text(providerData),
          ],
        ),
      ),
    );
  }
}


// ! CounterPage class with ConsumerStatefulWidget (StatefulWidget with Riverpod)
// class CounterPage extends ConsumerStatefulWidget {
//   const CounterPage({super.key});

//   @override
//   ConsumerState<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends ConsumerState<CounterPage> {
//   @override
//   Widget build(BuildContext context) {
//     var providerData = ref.watch(staticTextDataProvider);
//         var counter = ref.watch(counterProvider);

//     // ! invalid use for counter value without state object    
//     // var counter = ref.watch(counterProvider.notifier).counter;
//     return Scaffold(
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).increment();
//             },
//             child: Icon(Icons.add),
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).decrement();
//             },
//             child: Icon(Icons.remove),
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).reset();
//             },
//             child: Icon(Icons.exposure_zero),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(counter.toString(), style: TextStyle(fontSize: 50)),
//             SizedBox(height: 20),
//             Text(providerData),
//           ],
//         ),
//       ),
//     );
//   }
// }

