import 'package:flutter/material.dart';

class UserInputPage extends StatelessWidget {
  UserInputPage({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              cursorColor: Colors.black,
              autofocus: false,
              // enabled: false,
              enabled: true,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                icon: Icon(Icons.person),
                prefix: Icon(Icons.person_outline),
                prefixIcon: Icon(Icons.person_add_disabled),
                // prefixText: "Email",
                prefixStyle: TextStyle(color: Colors.amber),
                prefixIconColor: Colors.orange,
                // suffix: Icon(Icons.visibility),
                suffixIcon: Icon(Icons.visibility_off),
                suffixText: "Email",
                suffixIconColor: Colors.green,
                suffixStyle: TextStyle(color: Colors.amber),
                // border: UnderlineInputBorder(),

                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.blue, width: 3),
                // ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 5),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: "Email",
                // label: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [Text("Email"), Icon(Icons.email)],
                // ),
                // hint: Text(
                //   "example: email@email.com",
                //   style: TextStyle(color: Colors.lightGreenAccent),
                // ),
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                print(emailController.text);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Login", style: TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
