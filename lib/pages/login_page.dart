import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_session_manager_example/core/blocs/app_bloc/app_bloc.dart';
import 'package:user_session_manager_example/models/login_model.dart';
import 'package:user_session_manager_example/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (state is UnAuthenticated) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("check your information")));
          }
        },
        builder: (BuildContext context, AppState state) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                state is! AppLoading
                    ? ElevatedButton(
                        onPressed: () {
                          context.read<AppBloc>().add(
                            Login(
                              loginModel: LoginModel(
                                email: "email",
                                password: "password",
                              ),
                            ),
                          );
                        },
                        child: Text("Login"),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
