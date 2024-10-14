import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route/route_fav/cubit/fav_cubit.dart';
import 'package:route/route_fav/cubit/fav_state.dart';
import 'package:route/route_fav/fav_item.dart';
import 'package:route/route_list/cubit/products_state.dart';
import 'package:route/search_part.dart';

import '../app_colors.dart';

class RouteFav extends StatelessWidget {
WishListViewModel viewModel = WishListViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> viewModel..getWishList(),
      child: BlocBuilder<WishListViewModel,FavStates>(
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.whitecolor,
              title: Text("Route",style: TextStyle(
                  color: AppColors.textcolor , fontSize: 25
              ),),),
            body: state is GetFavSuccessState ?
            Column(
              children: [
                SearchPart(),
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        return FavItem(wishListData: state.wishListResponse.data![index]);
                      },
                      itemCount: state.wishListResponse.data!.length,
                    )
                )
              ],
            ) :
                Center(child: CircularProgressIndicator(
                  color: AppColors.backgroundcolor,
                ),)
          );
        },

      ),
    );
  }
}
