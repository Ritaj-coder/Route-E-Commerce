
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/data/api_data.dart';
import 'package:route/data/model/Response/BrandResponse.dart';
import 'package:route/home_page/cubit/home_page_state.dart';
import 'package:route/route_list/cubit/products_state.dart';

import '../../data/model/Response/CategoryResponse.dart';
import '../../data/model/Response/ProductResponse.dart';

class ProductsViewModel extends Cubit<ProductsState> {
  ProductsViewModel():super(ProductsInitialState());

  ///todo: hold data -- handle logic

 List<ProductData>? products ;
 int numOfCartItem  = 0 ;

 static ProductsViewModel get(context) => BlocProvider.of(context);

  void getAllProducts()async{
    try {
      emit(ProductsLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.ststusMsg == 'fail') {
        emit(ProductsErrorState(errorMessage: response.message!));
      }
      else {
        products = (response.data ?? []).cast<ProductData>();
        emit(ProductsSuccessState(productresponse: response));
      }
    }catch(e){
      emit(ProductsErrorState(errorMessage: e.toString()));
    }
  }

  void addToCart(String productId)async{
   emit(AddCartLoadingState());
 var either = await ApiManager.addToCart(productId);
 either.fold(
         (error) => emit(AddCartErrorState(failures: error)),
         (r) {
           numOfCartItem = r.numOfCartItems!.toInt();
           emit(AddCartSuccessState(cartresponse: r));
         }
 );
  }

  void addtoWhisList(String productId)async{
    emit(FavLoadingState());
    var either = await ApiManager.addToWishList(productId);
    either.fold(
            (l) => emit(FavErrorState(failures: l)),
            (response) {
          emit(FavSuccessState(wishListResponse: response));
        }

    );
  }


}