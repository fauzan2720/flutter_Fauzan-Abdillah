import 'package:flutter/material.dart';
import 'package:project/core/extensions/double_ext.dart';
import 'package:project/core/themes/images.dart';
import 'package:project/view/sections/about_us_section.dart';
import 'package:project/view/sections/contact_us_section.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotelifoz"),
        leading: Image.asset(AppImages.logo),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://image.cermati.com/q_70,w_1200,h_800,c_fit/riqyfydm76gjfqojwuzz",
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            30.0.height,
            const ContactUsSection(),
            50.0.height,
            const AboutUsSection(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://thumb.viva.co.id/media/frontend/thumbs3/2019/07/16/5d2d59a5cf84f-hotel-88-jember_665_374.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
