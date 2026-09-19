import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreTestPage extends StatefulWidget {
  const CloudFirestoreTestPage({super.key});

  @override
  State<CloudFirestoreTestPage> createState() => _CloudFirestoreTestPageState();
}

class _CloudFirestoreTestPageState extends State<CloudFirestoreTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore db = FirebaseFirestore.instance;
          final product = <String, dynamic>{
            "title": "blabla2030 S25 Ultra",
            "price": 1300,
          };

          try {
            db.collection("products").add(product);
            setState(() {
              
            });
          } catch (e) {
            print(e);
          }
        },
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("products").get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.docs[index].data()["title"]),
                    leading: Text(
                      snapshot.data!.docs[index].data()["price"].toString(),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
