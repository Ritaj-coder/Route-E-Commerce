import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/app_colors.dart';
import 'package:route/home_page/main_home.dart';
import 'package:route/home_screen/cubit/home_cubit.dart';
import 'package:route/home_screen/cubit/home_state.dart';
import 'package:route/route_fav/route_fav.dart';
import 'package:route/route_list/route_list.dart';
import 'package:route/route_settings/route_person.dart';


class HomeScreen extends StatelessWidget {
  static const String routename = "Home" ;

  HomeScreenCubit viewmodel = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit,HomeScreenState>(
      bloc: viewmodel,
      builder: (context,state){
        return Scaffold(
          backgroundColor: AppColors.whitecolor,
          bottomNavigationBar: BottomAppBar(
              shape:CircularNotchedRectangle(),
              child:  BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.backgroundcolor,
                selectedItemColor: AppColors.whitecolor,
                unselectedItemColor: AppColors.blackcolor,
                currentIndex: viewmodel.selectedindex,
                onTap: (index) {
                  viewmodel.changeSelectedIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 40,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.view_list,
                        size: 40,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon:Icon(
                        Icons.favorite ,
                        size: 40,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      label: ""),
                ],
              )
          ),
          body: viewmodel.tabs[viewmodel.selectedindex],
        );
      },

    );
  }
}