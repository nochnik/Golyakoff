import 'package:flutter/material.dart';
import 'package:golyak_off/product.dart';
import 'package:hive_flutter/adapters.dart';
import 'QRView.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRViewPage(),
    );
  }
}
