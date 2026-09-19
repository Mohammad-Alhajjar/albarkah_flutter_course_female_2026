import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/echo_stream_provider.dart';

class EchoPage extends ConsumerStatefulWidget {
  const EchoPage({super.key});

  @override
  ConsumerState<EchoPage> createState() => _EchoPageState();
}

class _EchoPageState extends ConsumerState<EchoPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final echoStreamResult = ref.watch(echoStreamProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: echoStreamResult.when(
              data: (data) {
                return Text(data);
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                print(echoStreamResult);
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty || controller.text == "") {
                    ref.read(webSocketProvider).sink.add(controller.text);
                  }
                  controller.clear();
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
