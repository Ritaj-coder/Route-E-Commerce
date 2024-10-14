import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:route/data/api_data.dart';
import 'package:route/home_page/brandlist.dart';
import 'package:route/home_page/categories_grid.dart';
import 'package:route/home_page/category_branditem.dart';
import 'package:route/home_page/categoryorbrand.dart';
import 'package:route/home_page/cubit/home_page_cubit.dart';
import 'package:route/home_page/cubit/home_page_state.dart';
import 'package:route/home_page/home_appliance.dart';

import '../search_part.dart';
class MainHome extends StatefulWidget {

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  HomePageViewModel viewModel = HomePageViewModel();
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomePageViewModel,HomePageState>(
bloc: viewModel..getAllCategories()..getAllBrands(),

       builder: (context,state){
     return Scaffold(
       appBar: AppBar(
         backgroundColor: AppColors.whitecolor,
         title: Text("Route",style: TextStyle(
             color: AppColors.textcolor , fontSize: 25
         ),),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             SearchPart(),
             CarouselSlider(
               items: [
                 Image.asset("assets/images/first.png",fit: BoxFit.fill,),
                 Image.asset("assets/images/second.png",fit: BoxFit.fill,),
                 Image.asset("assets/images/third.png",fit: BoxFit.fill,),
               ],
               options: CarouselOptions(
                 height: MediaQuery.of(context).size.height*0.25,
                 enlargeCenterPage: true,
                 autoPlay: true,
                 aspectRatio: 16/9,
                 autoPlayCurve: Curves.fastOutSlowIn,
                 enableInfiniteScroll: true,
                 autoPlayAnimationDuration: Duration(milliseconds: 800),
                 viewportFraction: 0.8,
               ),
             ),
             SizedBox(height: 20,),
             Text(
               'Categories', style: TextStyle(
                 fontSize: 18, fontWeight: FontWeight.bold,
                 color: AppColors.textcolor
             ),
             ),
             SizedBox(height: 20,),

             state is HomePageLoadingState ?
             Center(
               child: CircularProgressIndicator(
                 color: AppColors.backgroundcolor,
               ),
             ) :
         CategoryOrBrand(categories: viewModel.categorieslist!) ,

         SizedBox(height: 20,),
             Text(
               'Brands',
               style: TextStyle(
                   fontSize: 18, fontWeight: FontWeight.bold,
                   color: AppColors.textcolor
               ),
             ),
             SizedBox(height: 20,),


             state is HomePageBrandLoadingState ?
             Center(
               child: CircularProgressIndicator(
                 color: AppColors.backgroundcolor,
               ),
             ) :
         BrandlIst(brandslist: viewModel.brandlist!,)
         // CategoryOrBrand(),


           ],
         ),
       ),
     );
       },

     );

  }
}
