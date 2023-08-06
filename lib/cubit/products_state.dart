part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoding extends ProductsState {
  bool isLoaded = false;
  @override
  List<Object> get props => [isLoaded];
  ProductsLoding(this.isLoaded);
}

class ProductSloded extends ProductsState {
  final List<Products> productsList;
  const ProductSloded({required this.productsList});
  @override
  List<Object> get props => [productsList];
}

class ProductsError extends ProductsState {
  String message;

  ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
