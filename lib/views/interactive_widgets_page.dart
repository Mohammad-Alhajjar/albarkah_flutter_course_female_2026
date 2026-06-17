import 'package:flutter/material.dart';
import 'package:interactive_pages/views/home_page.dart';

class InteractiveWidgetsPage extends StatefulWidget {
  const InteractiveWidgetsPage({super.key});

  @override
  State<InteractiveWidgetsPage> createState() => _InteractiveWidgetsPageState();
}

class _InteractiveWidgetsPageState extends State<InteractiveWidgetsPage> {
  double sliderValue = 0.0;
  bool isDark = false;

  @override
  void initState() {
    print("###################initState function called#################");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("----------------build function called------------");
    return Scaffold(
      appBar: AppBar(title: Text("Interactive Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePageWithStatefulWidget();
              },
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://media.istockphoto.com/id/1394440950/photo/natural-view-cosmos-filed-and-sunset-on-garden-background.jpg?s=612x612&w=0&k=20&c=eBnRobwsk2w_9MqM6bnXukIia5j-ayuMS0PeB6GHN0E=",
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                year2023: true,
                label: sliderValue.toInt().toString(),
                min: 0,
                max: 10,
                divisions: 10,
                thumbColor: Colors.blue,
                activeColor: Colors.pink,
                inactiveColor: Colors.yellow,
                value: sliderValue,
                onChanged: (double newValue) {
                  // print(newValue);
                  sliderValue = newValue;
                  print(sliderValue);
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              Switch(
                value: isDark,
                activeTrackColor: Colors.red,
                activeThumbColor: Colors.deepPurple,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.black,
                hoverColor: Colors.amber,
                // activeThumbImage: ,
                // inactiveThumbImage: ,
                onChanged: (bool newValue) {
                  // print(value);
                  isDark = newValue;
                  print(isDark);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
