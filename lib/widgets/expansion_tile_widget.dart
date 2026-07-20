import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool custemIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ExpansionTile(
          title: Text("petir"),
          backgroundColor: Colors.greenAccent,
          collapsedBackgroundColor: Colors.blueGrey,
          textColor: const Color.fromARGB(255, 17, 86, 10),
          collapsedTextColor: const Color.fromARGB(255, 19, 34, 94),
          //   visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.leading,
          enabled: true,
          dense: true,
          maintainState: false,
          initiallyExpanded: false,
          //   showTrailingIcon: true,
          //   tilePadding: EdgeInsets.all(15),
          expandedAlignment: Alignment.center,
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          expansionAnimationStyle: AnimationStyle(
            curve: Curves.bounceOut,
            duration: Duration(seconds: 2),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images.png"),
          ),

          subtitle: Text("Flutter Developper"),
          trailing: Icon(
            custemIcon ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
          ),
          onExpansionChanged: (bool exapnded) {
            setState(() {
              print(exapnded);
              custemIcon = exapnded;
            });
          },
          children: [
            Text("Hello my name is petir"),
            TextFormField(
              decoration: InputDecoration(labelText: "this is date saved"),
            ),
            ExpansionTile(
              // leading: Icon(Icons.question_answer_outlined),
              title: Text("FAQ"),
              controlAffinity: ListTileControlAffinity.leading,
              children: [
                ExpansionTile(
                  title: Text("what is the time open"),
                  expandedAlignment: Alignment.centerLeft,
                  children: [Text("we will open 9Am")],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
