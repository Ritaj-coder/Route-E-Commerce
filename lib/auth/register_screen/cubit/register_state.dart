
import 'package:route/data/model/Response/RegisterResponse.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterResponse successMessage ;
  RegisterSuccessState({required this.successMessage});
}

class RegisterErrorState extends RegisterState {
  String errorMessage ;
  RegisterErrorState({required this.errorMessage});
}


