import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:linked_gates_task/Core/Networking/Apis/api.dart';
import 'package:linked_gates_task/Features/Home/Data/Repository/products_repo.dart';
import 'package:linked_gates_task/Features/Home/Logic/cubit/getproducts_cubit.dart';

final getIT = GetIt.instance;

Future<void> setUpGit() async {
  Dio dio = Dio();

  getIT.registerLazySingleton<StoreApi>(() => StoreApi(dio: dio));

  //Get Product
  getIT.registerLazySingleton<ProductsRepo>(
      () => ProductsRepo(storeApi: getIT()));
  getIT.registerFactory<GetproductsCubit>(() => GetproductsCubit(getIT()));
}
