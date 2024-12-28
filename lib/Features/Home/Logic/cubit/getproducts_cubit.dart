import 'package:bloc/bloc.dart';
import 'package:linked_gates_task/Features/Home/Data/Model/product_model.dart';
import 'package:linked_gates_task/Features/Home/Data/Repository/products_repo.dart';

part 'getproducts_state.dart';

class GetproductsCubit extends Cubit<GetproductsState> {
  final ProductsRepo productsRepo;
  GetproductsCubit(this.productsRepo) : super(GetproductsInitial());

  getProducts() async {
    emit(GetproductsLoading());
    try {
      List<ProductModel> products = await productsRepo.getProducts();
      emit(GetproductsSuccess(products));
    } catch (e) {
      emit(GetproductsFaliure(e.toString()));
    }
  }
}
