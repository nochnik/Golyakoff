import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  final List<String> items;
  final List<String> categories;

  ItemsPage({Key? key, required this.items, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsed Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            subtitle: Text(categories[index]),
          );
        },
      ),
    );
  }
}
