import 'package:linked_gates_task/Core/Networking/Apis/api.dart';
import 'package:linked_gates_task/Features/Home/Data/Model/product_model.dart';

class ProductsRepo {
  final StoreApi storeApi;

  ProductsRepo({required this.storeApi});

  Future<List<ProductModel>> getProducts() async {
    final response = await storeApi.getStoreData();
    return (response as List).map((e) => ProductModel.fromMap(e)).toList();
  }
}
