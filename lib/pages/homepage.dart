import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:const Text("Homepage"),
        centerTitle: true,
      ),
      drawer: Opacity(
        opacity: 0.8,
        child: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(child: Text("username")),
              ListTile(title: Text("item1"),
              ),
              ListTile(title: Text('item2'),),
              
            ],
          ),
          
        ),
      ),
      body:Column(
        children:  const [
          
          ],
      ),
    );
  }
}
