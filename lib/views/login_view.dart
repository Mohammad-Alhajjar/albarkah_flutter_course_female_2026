import 'package:flutter/material.dart';
import 'package:vlidation_buttons/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (String? value) {
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3}",
                  ).hasMatch(value!);
                  if (value.isEmpty) {
                    return "Please fill this filed";
                  } else if (!emailValid) {
                    return "please enter correct email form: example@email.com";
                  }
                  return null;
                },
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please fill this filed";
                  } else if (value.length < 6) {
                    return "passord must be more or equal 6 charcters";
                  }
                  return null;
                },
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 1.5,
                              child: Text(
                                "failed to login, please check your infromation and try again...",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.warning, color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment(0, 0),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
