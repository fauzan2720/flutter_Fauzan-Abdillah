import 'package:first_project/core/colors.dart';
import 'package:first_project/model/dummy.dart';
import 'package:first_project/pages/contacts_page.dart';
import 'package:first_project/pages/preview_image_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  static const routeName = 'gallery_page';

  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        itemCount: Dummy.gallery.length,
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
                          return AlertDialog(
                            title: const Text("Open image ?"),
                            content: Image.asset(
                              Dummy.gallery[index],
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
                                      imageUrl: Dummy.gallery[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child:
                          Image.asset(Dummy.gallery[index], fit: BoxFit.cover),
                    ),
                  );
                },
              );
            },
            child: Image.asset(
              Dummy.gallery[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, ContactsPage.routeName),
        backgroundColor: AppColors.cardColor,
        child: const Icon(Icons.contact_page),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
