import 'package:auth_example/models/login_model.dart';
import 'package:auth_example/services/auth_service.dart';
import 'package:auth_example/view/profile_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  labelText: "username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              if (!isLoading)
                FilledButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {
                      
                    });
                    bool isLogged = await AuthService().login(
                      loginInfo: LoginModel(
                        username: username.text,
                        password: password.text,
                      ),
                    );
                    if (isLogged) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileView()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("check your infromation and try again"),
                        ),
                      );
                    }
                    isLoading = false;
                    setState(() {
                      
                    });
                  },
                  child: Text("Login"),
                ),
              if (isLoading) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
