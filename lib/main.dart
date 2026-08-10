import 'package:flutter/material.dart';
import 'package:user_session_manager_example/core/config/di.dart';
import 'package:user_session_manager_example/core/storage/secure_session_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());

  // SecureSessionStorage(secureStorage: null);

  // BlocProvider(
  //   create: (context) => AuthBloc(authService: AuthService(secureStorage: FlutterSecureStoage(), sharedPfre: SharedPref(), dio: Dio(), ));
  // );

  //     BlocProvider(
  //     create: (context) => getIt.get<AuthBloc>());
  //   );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Container());
  }
}
