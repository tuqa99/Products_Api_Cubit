import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../products_model/products_Model.dart';
import '../sevices/services.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  List<Products> productList = [];
  ApiService apiService;
  ProductsCubit({required this.apiService}) : super(ProductsInitial());
  void getAllProduct() async {
    try {
      emit(ProductsLoding(isLoaded: true));
      productList = await apiService.getDataproducts();
      emit(ProductSloded(productsList: productList));
      emit(ProductsLoding(isLoaded: false));
    } catch (e) {
      emit(ProductsError(message: e.toString()));
    }
  }
}
