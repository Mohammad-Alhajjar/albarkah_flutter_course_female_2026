// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cart_example/models/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject{
  @HiveField(0)
  final ProductModel product;
  @HiveField(1)
  int quatity;

  CartItem({required this.product, this.quatity = 1});
}
