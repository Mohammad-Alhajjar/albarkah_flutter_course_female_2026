import 'package:flutter/material.dart';

class AboutDialogWidget extends StatefulWidget {
  const AboutDialogWidget({super.key});

  @override
  State<AboutDialogWidget> createState() => _AboutDialogWidgetState();
}

class _AboutDialogWidgetState extends State<AboutDialogWidget> {
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
              'AboutDialog',
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
                    return AboutDialog(
                      
                    //* ----------------لا يوجد تنسيق لون الخلفية او النصوص------------------------

                      //! applicationIcon
                      applicationIcon: FlutterLogo(),
                      
                      //! Name 
                      applicationName: 'Flutter App',

                      //! version
                      applicationVersion: 'version 1.0.0',

                      //! Legalese
                      applicationLegalese: 'Legalese',
                      
                      //! children 
                        children: [
                          Text('about your App'),
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
              child: Text('AboutDialog', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
