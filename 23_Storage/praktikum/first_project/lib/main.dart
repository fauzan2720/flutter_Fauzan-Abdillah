import 'package:first_project/core/colors.dart';
import 'package:first_project/presentation/cubit/auth/auth_cubit.dart';
import 'package:first_project/presentation/cubit/contact/contact_cubit.dart';
import 'package:first_project/presentation/pages/contacts_page.dart';
import 'package:first_project/presentation/pages/gallery_page.dart';
import 'package:first_project/presentation/pages/login_page.dart';
import 'package:first_project/presentation/pages/preview_image_page.dart';
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
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          ContactsPage.routeName: (context) => const ContactsPage(),
          // FormPickerPage.routeName: (context) => const FormPickerPage(),
          GalleryPage.routeName: (context) => const GalleryPage(),
          PreviewImagePage.routeName: (context) => const PreviewImagePage(),
        },
      ),
    );
  }

  static final List<BlocProvider> _providers = [
    BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
    BlocProvider<ContactCubit>(create: (context) => ContactCubit()),
  ];
}
