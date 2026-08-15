import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_session_manager_example/core/blocs/app_bloc/app_bloc.dart';
import 'package:user_session_manager_example/pages/home_page.dart';
import 'package:user_session_manager_example/pages/login_page.dart';
import 'package:user_session_manager_example/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        context.read<AppBloc>().add(AppStarted());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ShowOnboarding) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingPage()),
            );
          } else if (state is UnAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (state is AppFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("App failed to start...")));
          }
        },
        child: Center(child: Icon(Icons.facebook, size: 100)),
      ),
    );
  }
}
