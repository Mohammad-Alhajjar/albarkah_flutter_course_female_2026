import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int newValue = 3;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            padding: EdgeInsets.all(20),
            indicatorColor: Colors.pink,
            indicatorWeight: 10,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorAnimation: TabIndicatorAnimation.elastic,
            indicatorPadding: EdgeInsets.all(10),
            //indicator: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.yellow),
            //dividerColor: Colors.greenAccent,
            dividerHeight: 0,
            labelColor: Colors.blue,
            //labelStyle: TextStyle(fontSize: 12,backgroundColor: Colors.blueGrey),
            //labelPadding: EdgeInsets.all(8),
            unselectedLabelColor: Colors.amber,
            //unselectedLabelStyle: TextStyle(fontSize: 20),
            dragStartBehavior: DragStartBehavior.down,
            // enableFeedback: true,
            tabAlignment: TabAlignment.fill,
            onTap: (int value) {
              newValue++;
              value = newValue;
              print(newValue);
              setState(() {});
            },
            //mouseCursor: MouseCursor.uncontrolled,
            isScrollable: false,
            tabs: [
              Tab(
                icon: Icon(Icons.laptop),
                text: "Laptop",
                //child: Text("Laptop"),
              ),
              Tab(
                icon: Icon(Icons.mobile_friendly),
                text: "Mobile",
                // child: Text("Mobile"),
              ),
              Tab(
                icon: Icon(Icons.computer),
                text: "Pc",
                //child: Text("Pc"),
              ),
            ],
          ),
        ),
        body: Container(
          alignment: Alignment(0, 0),
          padding: EdgeInsets.all(10),
          child: TabBarView(
            dragStartBehavior: DragStartBehavior.start,
            children: [
              Text("Laptop Page"),
              Text("Mobile Page"),
              Text("Pc Page"),
            ],
          ),
        ),
      ),
    );
  }
}
