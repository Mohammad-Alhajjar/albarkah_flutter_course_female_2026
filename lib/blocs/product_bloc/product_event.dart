part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetProducts extends ProductEvent {
  final String test;

  GetProducts({required this.test});
}
