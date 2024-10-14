import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/auth/login_screen/login_screen.dart';
import 'package:route/auth/register_screen/cubit/register_cubit.dart';
import 'package:route/auth/register_screen/cubit/register_state.dart';
import 'package:route/dialog_alert.dart';
import 'package:route/home_screen/home_screen.dart';

import '../../app_colors.dart';
import '../user_data.dart';

class RegisterScreen extends StatefulWidget {
  static const String routename = "Register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit  = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
      bloc: cubit,
      listener: (context,state) {
        if(state is RegisterLoadingState){
        DialogCode.showLoading(context: context, loading: "Loading");
        }
        else if (state is RegisterErrorState){
          DialogCode.hideloading(context);
          DialogCode.showMessage(context: context, content: state.errorMessage,
              posActName: "Ok" , title: "Error" );

        }else if (state is RegisterSuccessState){
        DialogCode.hideloading(context);
        DialogCode.showMessage(context: context, content: "Register successed",
      posActName: "Ok" , title: "Success",
            posAction: (){
              Navigator.pushNamed(context, HomeScreen.routename);
            });
        }
    },
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors.backgroundcolor,
        //   title: Text("Create An Account"),
        //   centerTitle: true,
        // ),
        backgroundColor: AppColors.backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/images/route.png"),
                    SizedBox(height: 80,),
                    UserData(labelText: "User Name",
                      controller: cubit.namecontroller,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "PLEASE ENTER UserName";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
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
                    SizedBox(height: 20,),
                    UserData(labelText: "Confrim Password",
                      controller: cubit.confcontroller,
                      obscureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "PLEASE ENTER PASSWORD";
                        }
                        if (text.length < 6) {
                          return "PASSWORD MUST BE AT LEAST 6";
                        }
                        if (text !=cubit. passcontroller.text) {
                          return "CONFIRM PASSWORD MUST MATCH PASSWORD!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    UserData(labelText: "Mobile Phone",
                      controller: cubit.mobilecontroller,
                      keyboardtype: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "PLEASE ENTER Phone Number";
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
                          cubit.register();
                          }, child: Text("Create Account",style: TextStyle(
                        fontSize: 20 , color: AppColors.backgroundcolor
                      ),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text("Return Back to Login Page ?",
                          style: TextStyle(
                            color: AppColors.whitecolor ,
                            fontSize: 20
                          ),),
                          TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, LoginScreen.routename);
                              },
                              child: Text("Sign in",
                              style: TextStyle(
                                fontSize: 20 , color: AppColors.whitecolor
                              ),)
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
