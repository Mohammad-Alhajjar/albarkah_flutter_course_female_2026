import 'package:flutter/material.dart';

class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
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
              'AlertDialog',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40),
            FilledButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  //barrierColor: Colors.amberAccent.shade200,
                  // animationStyle:AnimationStyle(duration: Duration(seconds: 3),curve: Curves.easeIn ),
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      //? اذا تركناها فاضية بتعطي ظل للشاشة فقط
                      //backgroundColor: Colors.amberAccent.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),

                      alignment: Alignment(0, 0),
                      scrollable: true,
                      shadowColor: Colors.amber,
                      surfaceTintColor: Colors.amber.shade200,

                      //! icon
                      icon: FlutterLogo(),
                      //iconPadding: EdgeInsets.all(10),
                      //iconColor: Colors.blue,

                      //! title
                      title: Text('Logout'),
                      titlePadding: EdgeInsets.all(10),
                      titleTextStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),

                      //! content
                      content: //Text('Are you sure?'),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Are you sure?'),
                          FlutterLogo(),
                          Text('Are you sure?'),
                        ],
                      ),

                      contentPadding: EdgeInsets.all(20),
                      // contentTextStyle: TextStyle(
                      //   color: Colors.black12,
                      //   fontSize: 20,
                      //   fontWeight: FontWeight(200),
                      // ),

                      //! actions
                      actions: [
                        //? TextButton
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'cancer',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),

                        //? FilledButton
                        FilledButton(
                          onPressed: () {
                            print('Click the button');
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Logout'),
                        ),
                      ],
                      //actionsPadding: EdgeInsets.all(20),
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
