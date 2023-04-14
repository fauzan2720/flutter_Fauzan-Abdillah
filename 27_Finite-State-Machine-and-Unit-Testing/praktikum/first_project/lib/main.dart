import 'package:first_project/core/colors.dart';
import 'package:first_project/view/pages/contacts_page.dart';
import 'package:first_project/view/pages/food_page.dart';
import 'package:first_project/view/pages/image_generator_page.dart';
import 'package:first_project/view/pages/posts_page.dart';
import 'package:first_project/view_model/contact_provider.dart';
import 'package:first_project/view_model/food_provider.dart';
import 'package:first_project/view_model/image_generator.dart';
import 'package:first_project/view_model/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: AppColors.background,
            centerTitle: true,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: ContactsPage.routeName,
        routes: {
          ContactsPage.routeName: (context) => const ContactsPage(),
          ImageGeneratorPage.routeName: (context) => const ImageGeneratorPage(),
          PostsPage.routeName: (context) => const PostsPage(),
          FoodPage.routeName: (context) => const FoodPage(),
        },
      ),
    );
  }

  static final List<ChangeNotifierProvider> _providers = [
    ChangeNotifierProvider<ContactProvider>(
        create: (context) => ContactProvider()),
    ChangeNotifierProvider<PostProvider>(create: (context) => PostProvider()),
    ChangeNotifierProvider<ImageGeneratorProvider>(
        create: (context) => ImageGeneratorProvider()),
    ChangeNotifierProvider<FoodProvider>(create: (context) => FoodProvider()),
  ];
}
