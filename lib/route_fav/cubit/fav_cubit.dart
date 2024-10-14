
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/data/api_data.dart';
import 'package:route/data/model/Response/GetWishListResponse.dart';
import 'package:route/route_fav/cubit/fav_state.dart';

class WishListViewModel extends Cubit<FavStates>{
  WishListViewModel():super(GetFavInitialState());

  static WishListViewModel get(context) => BlocProvider.of(context);
///todo: hold data -- handle logic

  List<WishListData> productslist = [];

  void getWishList()async{
    emit(GetFavLoadingState());
    var either = await ApiManager.getWishList();
    either.fold(
            (l) => emit(GetFavErrorState(failures: l)),
            (response) {
          emit(GetFavSuccessState(wishListResponse: response));
        }

    );
  }

  void deleteItemInWishList(String productId)async{
    emit(DeleteFavLoadingState());
    var either = await ApiManager.deleteWishList(productId);
    either.fold(
            (l) => emit(DeleteFavErrorState(failures: l)),
            (response) {
          // productslist = response.data!.products!.cast<GetCartData>();
         emit(GetFavSuccessState(wishListResponse:response));
        }
        );
  }

}