import 'package:first_project/core/colors.dart';
import 'package:first_project/presentation/pages/contacts_page.dart';
import 'package:first_project/presentation/pages/preview_image_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  static const routeName = 'gallery_page';

  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List gallery = [
      'assets/images/boruto.jpg',
      'assets/images/conan.jpg',
      'assets/images/deku.jpg',
      'assets/images/eren.jpeg',
      'assets/images/gintoki.png',
      'assets/images/goku.png',
      'assets/images/luffy.jpg',
      'assets/images/naruto.png',
      'assets/images/sasuke.jpeg',
      'assets/images/shanks.jpg',
      'assets/images/takemichi.jpg',
      'assets/images/tanjiro.jpg',
      'assets/images/zoro.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 9 / 16,
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemCount: gallery.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Hero(
                            tag: gallery[index],
                            child: AlertDialog(
                              title: const Text("Open image ?"),
                              content: Image.asset(
                                gallery[index],
                                fit: BoxFit.cover,
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Tidak"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text("Ya"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      PreviewImagePage.routeName,
                                      arguments: PreviewImagePage(
                                        imageUrl: gallery[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(gallery[index], fit: BoxFit.cover),
                    ),
                  );
                },
              );
            },
            child: Hero(
              tag: gallery[index],
              child: Image.asset(
                gallery[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ContactsPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(-0.5, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        backgroundColor: AppColors.cardColor,
        child: const Icon(Icons.contact_page),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
