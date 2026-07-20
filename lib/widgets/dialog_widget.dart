import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
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
              'Dialog',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  // barrierColor: Colors.amberAccent.shade200,
                  animationStyle: AnimationStyle(
                    duration: Duration(seconds: 3),
                    curve: Curves.easeIn,
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      // backgroundColor: Colors.amberAccent.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      insetAnimationDuration: Duration(seconds: 3),
                      insetAnimationCurve: Curves.bounceIn,

                      alignment: Alignment(0, 0),
                      // shadowColor: Colors.amber,
                      // surfaceTintColor: Colors.amber.shade200,

                      //! child
                      //* -------------------------- نضع في child التصميم الذي يناسبنا غير مقسمه----------------------------
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlutterLogo(),
                          Text('Are you sure?'),
                          Image.network(
                            'https://tse4.mm.bing.net/th/id/OIP.I0kefg00rWR5bPZ8rl8u1AHaHa?r=0&cb=thfvnextfalcon4&rs=1&pid=ImgDetMain&o=7&rm=3',
                            height: 40,
                            width: 40,
                          ),
                          Text('Are you sure?'),
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
