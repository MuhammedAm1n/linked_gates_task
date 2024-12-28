part of 'getproducts_cubit.dart';

sealed class GetproductsState {}

final class GetproductsInitial extends GetproductsState {}

final class GetproductsLoading extends GetproductsState {}

final class GetproductsSuccess extends GetproductsState {
  final List<ProductModel> products;
  GetproductsSuccess(this.products);
}

final class GetproductsFaliure extends GetproductsState {
  final String errMessage;
  GetproductsFaliure(this.errMessage);
}
