import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';
import 'package:route/data/model/Response/ProductResponse.dart';
import 'package:route/route_list/cubit/products_cubit.dart';

class ProductsList extends StatelessWidget {
  ProductData product ;

  ProductsList({required this.product});
 bool wishlist = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
       border: Border.all(
         color: AppColors.backgroundcolor,
         width: 1
       )
      ),
      child: Column(
        children: [
          Stack(
            children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(15.r),
               child: Image.network(product.imageCover??"",
               fit: BoxFit.cover, width: 191.w, height: 128.h,),
             ),
              Positioned(
                top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whitecolor,
                    radius: 15,
                    child: IconButton(
                      color: AppColors.backgroundcolor,
                      padding: EdgeInsets.zero,
                      onPressed: (){
                      ProductsViewModel.get(context).
                      addtoWhisList(product.id??"");
                      },
                      icon: wishlist == true ?
                      const Icon(Icons.favorite_rounded) :
                      const Icon(Icons.favorite_border_rounded),
                    ),
                  )
              )
            ],
          ),
          SizedBox(height: 7,),
          Padding(
              padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.title??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18 , color: AppColors.textcolor ,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 7.h,),
          Padding(
              padding: EdgeInsets.only(left: 8.h),
            child: Row(
              children: [
                Text("EGP ${product.price}",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14 , color: AppColors.textcolor ,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
          SizedBox(height: 10.w,),
          Padding(
            padding: EdgeInsets.only(left: 8.w ,right: 8.w),
            child: Row(
              children: [
                Text("Review ${product.ratingsAverage}",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14 , color: AppColors.textcolor ,
                      fontWeight: FontWeight.w500
                  ),),
                SizedBox(width: 7.w,),
             Icon(Icons.star , color: Colors.yellow,),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: (){
               ProductsViewModel.get(context).addToCart(product.id ??"");
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.backgroundcolor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
