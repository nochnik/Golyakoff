import 'package:hive/hive.dart';

part 'product.g.dart';  // Name of the generated TypeAdapter file

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  Product({required this.name, required this.category});
}
