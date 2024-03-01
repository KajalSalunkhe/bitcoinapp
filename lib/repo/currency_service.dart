import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyService {
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
