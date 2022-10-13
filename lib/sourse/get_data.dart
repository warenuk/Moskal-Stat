import 'package:http/http.dart' as http;

import 'package:html/parser.dart';

Future<List<dynamic>> getData() async {
  final response = await http.Client().get(
      Uri.parse('https://index.minfin.com.ua/ua/russian-invading/casualties/'));
  final List<dynamic> dataList = [];
  if (response.statusCode == 200) {
    var document = parse(response.body);

    for (int i = 0; i <= 12; i++) {
      dataList.add(document
          .getElementsByClassName('casualties')[0]
          .children[0]
          .children[0]
          .children[i]
          .text);
    }

    return dataList;
  } else {
    throw Exception('Error fetching users');
  }
}
