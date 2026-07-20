import 'package:flutter/material.dart';

class SimpleDialogWidget extends StatefulWidget {
  const SimpleDialogWidget({super.key});

  @override
  State<SimpleDialogWidget> createState() => _SimpleDialogWidgetState();
}

class _SimpleDialogWidgetState extends State<SimpleDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 60),
            SizedBox(height: 20),
            Text(
              'SimpleDialog',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  // barrierColor: Colors.amberAccent.shade200,
                  animationStyle: AnimationStyle(
                    duration: Duration(seconds: 3),
                    curve: Curves.easeIn,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      // backgroundColor: Colors.amberAccent.shade100.withAlpha(60),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadiusGeometry.circular(50),
                      // ),
                      alignment: Alignment(0, 0),
                      // shadowColor: Colors.amber,
                      // surfaceTintColor: Colors.amber.shade200,
                      //! title
                      title: Text('Logout'),
                      titlePadding: EdgeInsets.all(10),
                      titleTextStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: EdgeInsets.all(20),
                      //! children
                      children: [
                        Text('Are you sure?'),
                        FlutterLogo(),
                        Text('Are you sure?'),
                      ],
                    );
                  },
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Simple info dialog', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
