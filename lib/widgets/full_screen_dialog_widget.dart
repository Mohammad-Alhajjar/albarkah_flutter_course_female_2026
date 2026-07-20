import 'package:flutter/material.dart';

class FullScreenDialogWidget extends StatefulWidget {
  const FullScreenDialogWidget({super.key});

  @override
  State<FullScreenDialogWidget> createState() => _FullScreenDialogWidgetState();
}

class _FullScreenDialogWidgetState extends State<FullScreenDialogWidget> {
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
              'FullScreenDialog',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  barrierColor: Colors.amberAccent.shade200,
                  animationStyle: AnimationStyle(
                    duration: Duration(seconds: 3),
                    curve: Curves.easeIn,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog.fullscreen(
                      backgroundColor: Colors.amberAccent.shade100,
                      insetAnimationDuration: Duration(seconds: 3),
                      insetAnimationCurve: Curves.linear,

                      //! child
                      child: //Text('Are you sure?'),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Are you sure?'),
                                FlutterLogo(),
                                Text('Are you sure?'),
                              ],
                            ),
                          ),
                        ],
                      ),
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
              child: Text('Logout', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
