
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/home_screen/cubit/home_state.dart';

import '../../home_page/main_home.dart';
import '../../route_fav/route_fav.dart';
import '../../route_list/route_list.dart';
import '../../route_settings/route_person.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() :super(HomeInitialState());
  ///todo : hold data -- handle logic
  int selectedindex = 0;
  List<Widget> tabs = [
    MainHome(),RouteList(),
    RouteFav(), RoutePerson()
  ];

  void changeSelectedIndex(int newindex){
    emit(HomeInitialState());
    selectedindex = newindex ;
    emit(changeSelectedIndexState());
  }
}
