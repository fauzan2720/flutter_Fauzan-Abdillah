import 'package:first_project/core/colors.dart';
import 'package:first_project/view/pages/contacts_page.dart';
import 'package:first_project/view/pages/image_generator_page.dart';
import 'package:first_project/view/pages/posts_page.dart';
import 'package:first_project/view_model/contact/contact_cubit.dart';
import 'package:first_project/view_model/image_generator/image_generator_cubit.dart';
import 'package:first_project/view_model/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        },
      ),
    );
  }

  static final List<BlocProvider> _providers = [
    BlocProvider<ContactCubit>(create: (context) => ContactCubit()),
    BlocProvider<PostCubit>(create: (context) => PostCubit()),
    BlocProvider<ImageGeneratorCubit>(
        create: (context) => ImageGeneratorCubit()),
  ];
}
