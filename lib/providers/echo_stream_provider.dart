import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketProvider = Provider.autoDispose((ref) {
  final channel = WebSocketChannel.connect(
    Uri.parse("ws://echo.websocket.org"),
  );

  ref.onDispose(() {
    channel.sink.close();
  });

  return channel;
});

final echoStreamProvider = StreamProvider.autoDispose((ref) {
  final channel = ref.watch(webSocketProvider);
  print(channel.stream);

  return channel.stream;
});
