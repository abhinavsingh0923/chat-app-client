import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Myloginpage extends StatefulWidget {
  const Myloginpage({super.key});

  @override
  State<Myloginpage> createState() => _MyloginpageState();
}

class _MyloginpageState extends State<Myloginpage> {
  final storage = new FlutterSecureStorage();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginRequest() async {
    var url = Uri.parse('http://10.0.2.2:8000/auth/login/');

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text
        }),
      );

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        var responseData = jsonDecode(response.body);
        print('Response: $responseData');
        print(responseData['key']);
        await storage.write(key: "token", value: responseData['key']);
        await storage.write(key: "user", value: _usernameController.text);
        Get.snackbar("login successful",'congratulations you loged in now');
      } else if (response.statusCode == 400) {
        Get.snackbar('Login failed', "invalid Credential");
      } else {
        // Request failed, handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while making the request
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                height: 40,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.mail),
                  labelText: "Email",
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  labelText: "Password",
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 40,
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      loginRequest();
                    },
                    child: const Text('Login'),
                  ))
            ]),
      ),
    );
  }
}
