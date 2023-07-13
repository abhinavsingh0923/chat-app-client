
import 'package:chat_app/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api requesta/homepage_api_request.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
OpenseaController openseaController = Get.put(OpenseaController());

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
      body:Obx(() => openseaController.isLoading.value ? Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(
        itemCount: openseaController.Apidata?.data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(openseaController.Apidata?.data![index].name ??
                            'no name'),
            subtitle: Text(openseaController.Apidata?.data![index].branch ??
                            'no branch'),
            leading: Text(openseaController.Apidata?.data![index].idNo ??
                            'no name'),
          );
        },
      ),
      ),
    );
  }
}
