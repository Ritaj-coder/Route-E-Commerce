import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';
import 'package:route/auth/login_screen/login_screen.dart';
import 'package:route/auth/register_screen/cubit/register_cubit.dart';
import 'package:route/auth/register_screen/cubit/register_state.dart';
import 'package:route/auth/user_data.dart';
import 'package:route/data/model/Response/RegisterResponse.dart';
import 'package:route/route_settings/user_data_store.dart';
import 'package:route/shared_preferences.dart';

class RoutePerson extends StatelessWidget {

  RegisterCubit viewModel = RegisterCubit();
  @override
  Widget build(BuildContext context) {
        return BlocBuilder<RegisterCubit,RegisterState>(
          bloc: viewModel,
          builder: (context, state) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset("assets/images/route1.png",
                            fit: BoxFit.cover,
                            width: 100, color: AppColors.backgroundcolor),
                      ),
                      SizedBox(width: 200,),
                      IconButton(
                          onPressed: (){
                            SharedPreferenceutils.RemoveData(key: 'token');
                            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routename,
                                    (route)=> false);
                          },
                          icon: Icon(Icons.login_outlined,
                            color: AppColors.backgroundcolor,size: 30,)
                      )],) ,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Welcome Mariam ",style: TextStyle(
                              fontSize: 22 , color: AppColors.textcolor ,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("m@gmail.com",style: TextStyle(
                            fontSize: 20 , color: AppColors.blackcolor ,),),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text("Your Full Name",
                                        style: TextStyle(
                                            fontSize: 22 , color: AppColors.textcolor ,
                                            fontWeight: FontWeight.bold
                                        )),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.whitecolor,
                                          borderRadius: BorderRadius.circular(30.r),
                                          border: Border.all(color: AppColors.backgroundcolor)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Mariam" , style: TextStyle(
                                            fontSize: 22 , fontWeight: FontWeight.bold , color: AppColors.backgroundcolor
                                        ),),),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Your E_Mail",
                                        style: TextStyle(
                                            fontSize: 22 , color: AppColors.textcolor ,
                                            fontWeight: FontWeight.bold
                                        )),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.whitecolor,
                                          borderRadius: BorderRadius.circular(30.r),
                                          border: Border.all(color: AppColors.backgroundcolor)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("m@gmail.com" , style: TextStyle(
                                            fontSize: 22 , fontWeight: FontWeight.bold , color: AppColors.backgroundcolor
                                        ),),),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Your Password",
                                        style: TextStyle(
                                            fontSize: 22 , color: AppColors.textcolor ,
                                            fontWeight: FontWeight.bold
                                        )),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.whitecolor,
                                          borderRadius: BorderRadius.circular(30.r),
                                          border: Border.all(color: AppColors.backgroundcolor)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("123456" , style: TextStyle(
                                            fontSize: 22 , fontWeight: FontWeight.bold , color: AppColors.backgroundcolor
                                        ),),),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Your Mobile Number",
                                        style: TextStyle(
                                            fontSize: 22 , color: AppColors.textcolor ,
                                            fontWeight: FontWeight.bold
                                        )),
                                    SizedBox(height: 10,),
                                    Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.whitecolor,
                                          borderRadius: BorderRadius.circular(30.r),
                                          border: Border.all(color: AppColors.backgroundcolor)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("01205828732" , style: TextStyle(
                                            fontSize: 22 , fontWeight: FontWeight.bold , color: AppColors.backgroundcolor
                                        ),),),
                                    ),

                                  ],
                                ),
                              ),
                            )
                        )

                      ],
                    ),
                  ),
                ],
              ),

            );
          },

        );

  }
}
