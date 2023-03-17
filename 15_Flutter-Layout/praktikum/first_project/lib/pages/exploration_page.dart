import 'package:first_project/core/colors.dart';
import 'package:first_project/model/data_model.dart';
import 'package:flutter/material.dart';

class MyFlutterPage extends StatefulWidget {
  static const routeName = 'my_flutter_page';

  const MyFlutterPage({super.key});

  @override
  State<MyFlutterPage> createState() => _MyFlutterPageState();
}

class _MyFlutterPageState extends State<MyFlutterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: listFavorites.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(listFavorites[index]),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Fovorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              print("This is Favorites Page");
              break;
            case 1:
              print("This is Search Page");
              break;
            case 2:
              print("This is Information Page");
              break;
            default:
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listFavorites.add('New Learn');
          setState(() {});
        },
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
