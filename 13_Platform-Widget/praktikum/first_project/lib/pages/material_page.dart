import 'package:first_project/model/data_model.dart';
import 'package:flutter/material.dart';

class MyMaterialPage extends StatelessWidget {
  static const routeName = 'my_material_page';

  const MyMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dataModels.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(
                  dataModels[index].name[0],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(dataModels[index].name),
              subtitle: Text(dataModels[index].phone),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
