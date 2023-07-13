import 'dart:convert';
import 'package:chat_app/models/datamodel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OpenseaController extends GetxController {
  final storage = const FlutterSecureStorage();
  var isLoading = false.obs;
  // ignore: non_constant_identifier_names
  apidata? Apidata;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      var url = Uri.parse('http://10.0.2.2:3000/allstudents/');
      var token = await storage.read(key: 'token');
      var response = await http.get(url,headers: {
        'Content-type':'application/json',
        'Accept':'application/json',
        'Authorization': 'Token $token'
      });
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        Apidata = apidata.fromJson(result);
      } else {
        // ignore: avoid_print
        print('error fetching data');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}