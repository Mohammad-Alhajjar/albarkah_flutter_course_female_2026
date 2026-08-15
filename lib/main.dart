import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_session_manager_example/core/blocs/app_bloc/app_bloc.dart';
import 'package:user_session_manager_example/core/config/di.dart';
import 'package:user_session_manager_example/core/storage/app_prefrences.dart';
import 'package:user_session_manager_example/core/storage/secure_session_storage.dart';
import 'package:user_session_manager_example/pages/splash_page.dart';
import 'package:user_session_manager_example/services/auth_service.dart';

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
    // getIt.get<SharedPreferences>().clear();
    return BlocProvider(
      create: (context) => AppBloc(
        authService: AuthService(
          secureSessionStorage: SecureSessionStorage(
            secureStorage: FlutterSecureStorage(),
          ),
          appPrefrences: AppPrefrences(
            sharedPreferences: getIt.get<SharedPreferences>(),
          ),
        ),
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(home: SplashPage());
        },
      ),
    );
  }
}
