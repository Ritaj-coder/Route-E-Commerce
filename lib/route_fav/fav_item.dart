
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/data/model/Response/GetWishListResponse.dart';
import 'package:route/route_fav/cubit/fav_cubit.dart';

import '../app_colors.dart';
class FavItem extends StatelessWidget {

  WishListData wishListData ;

  FavItem({required this.wishListData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w,right: 16.w ,top: 24.h,bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.backgroundcolor,width: 1),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 130.w,
              height: 140.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.network(wishListData.imageCover??""),
            ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w,right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(wishListData.title??"",
                          style: TextStyle(
                              color: AppColors.textcolor ,fontSize: 20
                          ),),
                        IconButton(
                            onPressed: (){
                            WishListViewModel.get(context).
                            deleteItemInWishList(wishListData.id??"");
                            },
                            icon: Icon(Icons.favorite_outlined,
                            color: AppColors.backgroundcolor,)
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        Text("EGP ${wishListData.price}",style: TextStyle(
                            color: AppColors.textcolor, fontSize: 17
                        ),),
                        SizedBox(width: 40,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              ///delete
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundcolor,
                                  borderRadius: BorderRadius.circular(25.r),
                                  border: Border.all(color: AppColors.backgroundcolor)
                              ),
                              child:Center(
                                child: Text("Add To Cart",
                                style: TextStyle(fontSize: 18,
                                color: AppColors.whitecolor),),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
          ],
        ),
      ),
    );
  }
}
