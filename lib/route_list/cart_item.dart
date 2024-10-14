
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';
import 'package:route/data/model/Response/GetCartResponse.dart';
import 'package:route/route_list/cart_cubit/cart_cubit.dart';
class CartItem extends StatelessWidget {

  CartProducts cart ;
CartItem({required this.cart});

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
               clipBehavior: Clip.antiAlias ,
               width: 130.w,
               height: 145.h,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.r)
               ),
               child: Image.network(cart.product!.imageCover??""),
             ),

            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cart.product!.title??"",
                            style: TextStyle(
                            color: AppColors.textcolor ,fontSize: 20
                          ),),
                    IconButton(
                        onPressed: (){
                        CartviewModel.get(context).
                        deleteItemInCart(cart.product!.id??"");
                        },
                        icon: Icon(Icons.delete , color: AppColors.backgroundcolor,))
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 10.h),
                      child: Row(
                        children: [
                          Text("EGP ${cart.price}",style: TextStyle(
                            color: AppColors.textcolor, fontSize: 17
                          ),),
                          SizedBox(width: 30,),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundcolor,
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(color: AppColors.backgroundcolor)
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  padding:EdgeInsets.zero ,
                                    onPressed: (){
                                    int count = cart.count!.toInt();
                                    count -- ;
                               CartviewModel.get(context).updateCountInCart(
                                   cart.product!.id??"",
                                   count);
                               },
                                    icon: Icon(Icons.remove_circle_outline,
                                  color: AppColors.whitecolor ,size: 28.sp,  )
                                ),
                                Text("${cart.count}",style: TextStyle(
                                  fontSize: 18.sp , color: AppColors.whitecolor,
                                  fontWeight: FontWeight.w500
                                ),),
                                IconButton(
                                    padding:EdgeInsets.zero ,
                                    onPressed: (){
                                      int count = cart.count!.toInt();
                                      count ++ ;
                                      CartviewModel.get(context).updateCountInCart(
                                          cart.product!.id??"",
                                          count );
                                    },
                                    icon: Icon(Icons.add_circle_outline,
                                      color: AppColors.whitecolor ,size: 28.sp,  )
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
