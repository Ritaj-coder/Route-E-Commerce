
import 'package:route/data/failures.dart';
import 'package:route/data/model/Response/GetCartResponse.dart';

abstract class CartState {}

class CartLoadingState extends CartState {}

class CartInitialState extends CartState{}

class CartErrorState extends CartState{
 Failures failures ;
  CartErrorState({required this.failures});
}

class CartSuccessState extends CartState{
  GetCartResponse getcartresponse ;
  CartSuccessState({required this.getcartresponse});
}

class DeleteInCartLoadingState extends CartState {}

class DeleteInCartErrorState extends CartState{
  Failures failures ;
  DeleteInCartErrorState({required this.failures});
}

class DeleteInCartSuccessState extends CartState{
  GetCartResponse getcartresponse ;
  DeleteInCartSuccessState({required this.getcartresponse});
}

class UpdateCountLoadingState extends CartState {}

class UpdateCountInCartErrorState extends CartState{
  Failures failures ;
  UpdateCountInCartErrorState({required this.failures});
}
class UpdateCountInCartSuccessState extends CartState{
  GetCartResponse getcartresponse ;
  UpdateCountInCartSuccessState({required this.getcartresponse});
}
