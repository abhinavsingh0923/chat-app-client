import 'package:chat_app/pages/auth/loginpage.dart';
import 'package:chat_app/pages/auth/registerpage.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return const  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myhomepage(),
    );
  }
}