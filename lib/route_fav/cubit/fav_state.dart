
import 'package:route/data/failures.dart';
import 'package:route/data/model/Response/AddToWishListResponse.dart';
import 'package:route/data/model/Response/DeleteWishlistResponse.dart';
import 'package:route/data/model/Response/GetWishListResponse.dart';

abstract class FavStates{}

class GetFavInitialState extends FavStates{}

class GetFavLoadingState extends FavStates{}

class GetFavErrorState extends FavStates{
  Failures failures ;

  GetFavErrorState({required this.failures});
}
class GetFavSuccessState extends FavStates{
  GetWishListResponse wishListResponse ;
  GetFavSuccessState({required this.wishListResponse});
}

class DeleteFavLoadingState extends FavStates{}

class DeleteFavErrorState extends FavStates{
  Failures failures ;

  DeleteFavErrorState({required this.failures});
}
class DeleteFavSuccessState extends FavStates {
  GetWishListResponse deletewishListResponse;

  DeleteFavSuccessState({required this.deletewishListResponse});

}