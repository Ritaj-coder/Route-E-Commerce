import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/auth/login_screen/login_screen.dart';
import 'package:route/auth/register_screen/register_screen.dart';
import 'package:route/home_screen/home_screen.dart';
import 'package:route/route_fav/cubit/fav_cubit.dart';
import 'package:route/route_list/cart_cubit/cart_cubit.dart';
import 'package:route/route_list/cart_screen.dart';
import 'package:route/route_list/product_details.dart';
import 'package:route/route_list/route_list.dart';
import 'package:route/shared_preferences.dart';
import 'package:route/splash_screen.dart';

import 'bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceutils.init();
 var token = SharedPreferenceutils.GetData(key: 'token');
 String route ;
 if(token == null){
  route =LoginScreen.routename ;
 }else {
 route = HomeScreen.routename;
 }
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=> CartviewModel()),
      BlocProvider(create: (context)=> WishListViewModel())
    ],
      child: MyApp(route: route,)));
}
class MyApp extends StatelessWidget {
String route ;
MyApp({required this.route});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
       return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: route ,
          routes: {
            SplashScreen.routename : (context) => SplashScreen(),
            LoginScreen.routename: (context) => LoginScreen(),
            RegisterScreen.routename : (context) => RegisterScreen(),
            HomeScreen.routename : (context) => HomeScreen(),
            ProductDetails.routename : (context) => ProductDetails(),
            CartScreen.routename : (context) => CartScreen()
          },
        );
      }

    );
  }
}

