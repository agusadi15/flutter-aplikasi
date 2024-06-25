import 'package:flutter/material.dart';
import 'package:flutter_application_new/detailPage.dart';
import 'package:flutter_application_new/homePage.dart';
import 'package:flutter_application_new/loginGoogle.dart';
import 'package:flutter_application_new/loginform.dart';
import 'package:flutter_application_new/loginscreen.dart';
import 'package:flutter_application_new/profile_page.dart'; // Import ProfilePage
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/profile': (context) => ProfilePage(), // Register the profile route
      },
    );
  }
}
