import 'package:flutter/material.dart';
import 'package:splash_page_bottom_bar_drawer/views/cart_view.dart';
import 'package:splash_page_bottom_bar_drawer/views/home_view.dart';
import 'package:splash_page_bottom_bar_drawer/views/map_view.dart';
import 'package:splash_page_bottom_bar_drawer/views/profile_view.dart';
import 'package:splash_page_bottom_bar_drawer/views/wishlist_view.dart';

class MainNavigationBarWidget extends StatefulWidget {
  const MainNavigationBarWidget({super.key});

  @override
  State<MainNavigationBarWidget> createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState extends State<MainNavigationBarWidget> {
  int selectedIndex = 0;
  // String viewTitle = "Home Page";
  List<String> viewTitles = [
    "Home Page",
    "Map Page",
    "Cart Page",
    "Wishlist Page",
  ];

  List<Map<String, dynamic>> drawerItems = [
    {"title": "Profile", "icon": Icons.person, "view": ProfileView()},
    {"title": "Chat", "icon": Icons.chat, "view": ProfileView()},
    {
      "title": "Notification",
      "icon": Icons.notifications,
      "view": ProfileView(),
    },
    {"title": "Settings", "icon": Icons.settings, "view": ProfileView()},
    {"title": "Logout", "icon": Icons.logout, "view": ProfileView()},
  ];
  List<Widget> views = [HomeView(), MapView(), CartView(), WishlistView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        actions: [
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
        ],
        title: Text(viewTitles[selectedIndex]),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.network(
                "https://cdn-icons-png.flaticon.com/512/8345/8345328.png",
              ),
              accountName: Text("Mohamamd"),
              accountEmail: Text("mohammad@gmail.com"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drawerItems.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(drawerItems[index]["icon"]),
                    title: Text(drawerItems[index]["title"]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => drawerItems[index]["view"],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img.icons8.com/color/1200/apple-app-store--v1.jpg",
            ),
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade500,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        // height: 500,
        indicatorShape: BeveledRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        backgroundColor: Colors.blue,
        indicatorColor: Colors.indigoAccent,
        // surfaceTintColor: Colors.green,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int newDestinationIndex) {
          print(newDestinationIndex);
          selectedIndex = newDestinationIndex;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined, color: Colors.white),
            selectedIcon: Icon(Icons.location_on, color: Colors.white),
            label: "Map",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
            label: "Cart",
          ),
          NavigationDestination(
            enabled: true,
            selectedIcon: Icon(Icons.favorite, color: Colors.white),
            icon: Icon(Icons.favorite_outline, color: Colors.white),
            label: "Wishlist",
          ),
        ],
      ),
      body: views[selectedIndex],
    );
  }
}
