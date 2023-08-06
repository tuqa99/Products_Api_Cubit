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

// ignore: must_be_immutable
class ProductsLoding extends ProductsState {
  bool isLoaded = false;
  @override
  List<Object> get props => [isLoaded];
  ProductsLoding({required this.isLoaded});
}

class ProductSloded extends ProductsState {
  final List<Products> productsList;
  const ProductSloded({required this.productsList});
  @override
  List<Object> get props => [productsList];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
