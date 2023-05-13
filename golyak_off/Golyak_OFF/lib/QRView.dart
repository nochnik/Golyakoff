import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:golyak_off/ItemsPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRViewPage extends StatefulWidget {
  @override
  _QRViewPageState createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  String? result;
  List<String>? items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          if (result != null)
            Text('Data: $result')
          else
            Text('Scan a code'),
          if (items != null)
            ...items!.map((item) => Text(item)).toList(),
          ElevatedButton(
            onPressed: _simulateQRScan,
            child: Text('Simulate QR Scan'),
          ),
        ],
      ),
    );
  }

  void _simulateQRScan() async {
    String simulatedQRCode = 'https://ofd1.kz/t/?i=353123290128&f=010101506924&s=1995.0&t=20230417T215646'; // Replace with your URL
    var response = await http.post(
      Uri.http('10.0.2.2:5000', '/parse'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'url': simulatedQRCode,
      }),
    );

    if (response.statusCode == 200) {
      items = List<String>.from(jsonDecode(response.body));
      result = simulatedQRCode;

      // After getting the items, send them to the Flask server to be categorized
      var categoryResponse = await http.post(
        Uri.http('10.0.2.2:5000', '/categorize'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(items),
      );

      List<String>? categories;
      if (categoryResponse.statusCode == 200) {
        categories = List<String>.from(jsonDecode(categoryResponse.body));
      } else {
        throw Exception('Failed to categorize items');
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemsPage(items: items!, categories: categories!)),
      );
    } else {
      throw Exception('Failed to load items');
    }
  }

}
