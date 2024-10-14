
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/data/api_data.dart';
import 'package:route/data/model/Response/BrandResponse.dart';
import 'package:route/home_page/cubit/home_page_state.dart';

import '../../data/model/Response/CategoryResponse.dart';

class HomePageViewModel extends Cubit<HomePageState> {
  HomePageViewModel():super(HomePageInitialState());

  ///todo: hold data -- handle logic
  List<Data> categorieslist = [];
  List<DataBrand> brandlist = [];

  void getAllCategories()async{
    try {
      emit(HomePageLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomePageErrorState(errorMessage: response.message!));
      }
      else {
        categorieslist = (response.data ?? []).cast<Data>();
        if(categorieslist != null) {
          emit(HomePageSuccessState(categoryResponse: response));
        }
      }
    }catch(e){
    emit(HomePageErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands()async{
    try {
      emit(HomePageBrandLoadingState());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomePageBrandErrorState(errorMessage: response.message!));
      }
      else {
        brandlist = (response.data ?? []).cast<DataBrand>();
        if(brandlist != null) {
          emit(HomePageBrandSuccessState(brandResponse: response));
        }
      }
    }catch(e){
      emit(HomePageBrandErrorState(errorMessage: e.toString()));
    }
  }

}