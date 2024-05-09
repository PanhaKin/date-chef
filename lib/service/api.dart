import 'dart:convert';

import 'package:dating_chef/service/model.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://panha123.pythonanywhere.com/table';
Future<List<Order>> fetchAllData() async {
  final response = await http.get(Uri.parse('$baseUrl'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<Order> items = data.map((json) => Order.fromJson(json)).toList();
    return items;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Order>> fetchFoodOrder() async {
  final response = await http.get(Uri.parse('$baseUrl/order'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<Order> products =
        data.map((json) => Order.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<Order>> fetchFoodHistory() async {
  final response = await http.get(Uri.parse('$baseUrl/history'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<Order> products =
        data.map((json) => Order.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<void> updateTableEntry(String uid) async {
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/$uid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'complete': true,
      }),
    );

    if (response.statusCode == 200) {
      print('Table updated successfully');
    } else {
      print('Failed to update table: ${response.statusCode}');
      throw Exception('Failed to update table');
    }
  } catch (error) {
    print('Error updating table entry: $error');
    throw Exception('Failed to update table entry');
  }
}
