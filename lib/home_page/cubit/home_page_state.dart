import 'package:route/data/model/Response/CategoryResponse.dart';

import '../../data/model/Response/BrandResponse.dart';

abstract class HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageInitialState extends HomePageState{}

class HomePageErrorState extends HomePageState{
  String errorMessage ;
  HomePageErrorState({required this.errorMessage});
}
class HomePageSuccessState extends HomePageState{
  CategoryResponse categoryResponse ;
  HomePageSuccessState({required this.categoryResponse});
}
class HomePageBrandLoadingState extends HomePageState {}

class HomePageBrandErrorState extends HomePageState{
  String errorMessage ;
  HomePageBrandErrorState({required this.errorMessage});
}
class HomePageBrandSuccessState extends HomePageState{
  BrandResponse brandResponse ;
  HomePageBrandSuccessState({required this.brandResponse});
}