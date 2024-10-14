
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/auth/register_screen/cubit/register_state.dart';
import 'package:route/data/api_data.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitialState());

  ///todo: hold data -- handle logic
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController confcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isObscure = true ;

Future<void> register() async {
  if (formkey.currentState?.validate() == true) {
    try {
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
          namecontroller.text, emailcontroller.text,
          passcontroller.text, confcontroller.text, mobilecontroller.text);
      if (response.statusMsg == "fail") {
        emit(RegisterErrorState(errorMessage: response.message!));
      }
      else {
        emit(RegisterSuccessState(successMessage: response));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
}