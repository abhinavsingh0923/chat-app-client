import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

class Myregisterpage extends StatefulWidget {
  const Myregisterpage({super.key});

  @override
  State<Myregisterpage> createState() => _MyregisterpageState();
}

class _MyregisterpageState extends State<Myregisterpage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password1Controller = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  Future<void> RegisterRequest() async {
    var url = Uri.parse('http://10.0.2.2:8000/auth/register/');

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'password1': _password1Controller.text,
          'password2': _password2Controller.text,
          'email': _emailController.text
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 204) {
        // Request successful, do something with the response
        if (response.body.isNotEmpty) {
          json.decode(response.body);
        }
        print(response.statusCode);
        Get.snackbar("Congurats", "Your successful Register");
      } else if (response.statusCode == 400) {
        Get.snackbar('Login failed', "invalid Credential");
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while making the request
      print(' $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // username
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  labelText: "Username",
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.mail),
                  labelText: "Email",
                  hintText: 'Enter your Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // password1
              TextFormField(
                controller: _password1Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  labelText: "Password",
                  hintText: 'Enter your Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // password2
              TextFormField(
                controller: _password2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  labelText: "Confirm password",
                  hintText: 'write the same password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  RegisterRequest();
                },
                child: const Text("submit"),
              )
            ]),
      ),
    );
  }
}
