import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_task/models/data_model.dart';

//https://tilsinbreastcancer.org/tils_scores.json

class DataProvider{

  Future<List<DataModel>> getData() async {

    final url = Uri.parse('https://tilsinbreastcancer.org/tils_scores.json');

    final response = await http.get(url);

    if(response.statusCode == 200) {
      print(response.body);
      final List<dynamic> dataJson = json.decode(response.body);
      return dataJson.map((e) => DataModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed api connect');
    }
  }
}