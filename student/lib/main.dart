import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet/Admin/main.dart';
import 'package:projet/Admin/widgets/avatar.dart';
import 'package:projet/PompierUi/acceuil.dart';
import 'package:projet/SamuUi/acceuil.dart';

import 'package:projet/Sign/connection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: admin(),

    );
  }
}