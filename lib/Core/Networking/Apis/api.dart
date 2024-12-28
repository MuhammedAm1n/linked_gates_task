import 'package:dio/dio.dart';
import 'package:linked_gates_task/Core/Consts/contants.dart';
import 'package:linked_gates_task/Core/Networking/ErrorHandler/api_error_handler.dart';
import 'package:linked_gates_task/Core/Networking/ErrorHandler/api_exptions.dart';

class StoreApi {
  final Dio _dio;

  StoreApi({required Dio dio}) : _dio = dio;

  getStoreData() async {
    try {
      final response = await _dio.get(
        "${Constants.baseUrl}${Constants.getProducts}",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (error) {
      final api = ApiErrorHandler.handle(error);
      throw ApiException(api.message!);
    }
  }
}
