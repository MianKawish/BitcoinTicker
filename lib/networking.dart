import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  Networking({required this.currencyType, required this.bitCoinType});
  String currencyType;
  String bitCoinType;
  Future getCoinValue() async {
    Response response = await get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$bitCoinType/$currencyType?apikey=728A7E60-5F67-40EF-9A1C-01544D13080F'));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
