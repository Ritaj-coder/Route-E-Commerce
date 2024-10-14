
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/auth/login_screen/cubit/login_state.dart';
import 'package:route/data/api_data.dart';

class LoginCubit extends Cubit {
  LoginCubit():super(LoginInitialState());

///todo: hold data -- handle logic
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isObscure = true ;

  Future<void> login() async {
    if(formkey.currentState?.validate() == true){
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
            emailcontroller.text, passcontroller.text);

        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
        }
        else {
          emit(LoginSuccessState(successMessage: response));
        }
      }
      catch(e){
        emit(LoginErrorState(errorMessage: e.toString()));
      }

    }
  }
}