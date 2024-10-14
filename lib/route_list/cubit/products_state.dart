
import 'package:route/data/failures.dart';
import 'package:route/data/model/Response/AddToCartResponse.dart';
import 'package:route/data/model/Response/AddToWishListResponse.dart';
import 'package:route/data/model/Response/ProductResponse.dart';

abstract class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsInitialState extends ProductsState{}

class ProductsErrorState extends ProductsState{
String errorMessage ;

ProductsErrorState({required this.errorMessage});
}

class ProductsSuccessState extends ProductsState{
  ProductResponse productresponse ;
  ProductsSuccessState({required this.productresponse});
}

class AddCartLoadingState extends ProductsState {}

class AddCartErrorState extends ProductsState{
  Failures failures ;

  AddCartErrorState({required this.failures});
}

class AddCartSuccessState extends ProductsState{
  AddToCartResponse cartresponse ;
  AddCartSuccessState({required this.cartresponse});
}

class FavLoadingState extends ProductsState{}
class FavErrorState extends ProductsState{
  Failures failures ;

  FavErrorState({required this.failures});
}
class FavSuccessState extends ProductsState{
  AddToWishListResponse wishListResponse ;
  FavSuccessState({required this.wishListResponse});
}
