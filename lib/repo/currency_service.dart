import 'dart:convert';
import 'dart:developer';

import 'package:bitcoinapp/model/currency_data_model.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
 static Future<CurrencyData> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        print("response: ${response.body}");
        final data = CurrencyData.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (err) {
      rethrow;
    }
  }
}
