import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_init/pages/home_page.dart';
import 'package:firebase_init/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('The password provided is too weak.'),
                      ),
                    );
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'The account already exists for that email.',
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Sign Up"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("have account?"),
                SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
