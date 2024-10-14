
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/data/api_data.dart';
import 'package:route/data/model/Response/GetCartResponse.dart';
import 'package:route/route_list/cart_cubit/cart_states.dart';

class CartviewModel extends Cubit<CartState> {
  CartviewModel():super(CartInitialState());

  ///todo: hold data -- handle logic
  List<GetCartData> productslist = [];

   static CartviewModel get(context) => BlocProvider.of(context);

void getCart()async{
  emit(CartLoadingState());
 var either = await ApiManager.getCart();
 either.fold(
         (l) => emit(CartErrorState(failures: l)),
         (response) {
           productslist = response.data!.products!.cast<GetCartData>();
           emit(CartSuccessState(getcartresponse: response));
         }

 );
}

  void deleteItemInCart(String productId)async{
    emit(DeleteInCartLoadingState());
    var either = await ApiManager.deleteCart(productId);
    either.fold(
            (l) => emit(DeleteInCartErrorState(failures: l)),
            (response) {
          // productslist = response.data!.products!.cast<GetCartData>();
          emit(CartSuccessState(getcartresponse: response));
        }

    );
  }

  void updateCountInCart(String productId , int count)async{
    emit(UpdateCountLoadingState());
    var either = await ApiManager.updateCountCart(productId,count);
    either.fold(
            (l) => emit(UpdateCountInCartErrorState(failures: l)),
            (response) {
          // productslist = response.data!.products!.cast<GetCartData>();
          emit(CartSuccessState(getcartresponse: response));
        }

    );
  }



}