import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/app_colors.dart';
import 'package:route/auth/login_screen/cubit/login_cubit.dart';
import 'package:route/auth/register_screen/register_screen.dart';
import 'package:route/home_screen/home_screen.dart';

import '../../dialog_alert.dart';
import '../user_data.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
static const String routename = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
LoginCubit cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context,state){
        if(state is LoginLoadingState){
          DialogCode.showLoading(context: context, loading: "Waiting");
        }
        else if (state is LoginErrorState){
          DialogCode.hideloading(context);
          DialogCode.showMessage(context: context, content: state.errorMessage,
              posActName: "Ok" , title: "Error" );

        }else if (state is LoginSuccessState){
          DialogCode.hideloading(context);
          DialogCode.showMessage(context: context, content: "Login successed",
              posActName: "Ok" , title: "Success",
          posAction: (){
            Navigator.pushNamed(context, HomeScreen.routename);
          });
        }
      },
      child: Scaffold(
         // appBar: AppBar(
         //   backgroundColor: AppColors.backgroundcolor,
         //   title: Text("ROUTE"),
         //   centerTitle: true,
         // ),
        backgroundColor: AppColors.backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: cubit.formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/route.png"),
                  SizedBox(height: 80,),
                  Text("Welcome Back To Route",
                    style: TextStyle(
                        fontSize: 26 ,color: AppColors.whitecolor,
                      fontWeight: FontWeight.bold
                    ),),
                  Text("Please sign in with your mail",
                  style: TextStyle(
                    fontSize: 20 ,color: AppColors.whitecolor
                  ),),
                  SizedBox(height: 40,),
                  UserData(labelText: "Email",
                      controller: cubit.emailcontroller,
                    keyboardtype: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "PLEASE ENTER EMAIL";
                      }
                      final bool emailvalid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(cubit.emailcontroller.text);
                      if (!emailvalid) {
                        return "PLEASE ENTER VALID EMAIL";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  UserData(labelText: "Password",
                    controller: cubit.passcontroller,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "PLEASE ENTER PASSWORD";
                      }
                      if (text.length < 6) {
                        return "PASSWORD MUST BE AT LEAST 6";
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whitecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)
                        ),
                      ),
                        onPressed: (){
                         cubit.login();
                        }, child: Text("Login",style: TextStyle(
                      fontSize: 20 , color: AppColors.backgroundcolor
                    ),)),
                  ),
                 TextButton(
                     onPressed: (){
                       Navigator.pushNamed(context, RegisterScreen.routename);
                     },
                     child: Text("Or Create An Account",style: TextStyle(
                       fontSize: 22 , color: AppColors.whitecolor
                     ),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
