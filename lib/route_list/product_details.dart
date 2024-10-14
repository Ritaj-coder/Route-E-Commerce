import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';
import 'package:readmore/readmore.dart';
import 'package:route/data/model/Response/ProductResponse.dart';
import 'package:route/route_list/category_list.dart';

class ProductDetails extends StatelessWidget {
  static const String routename = 'Details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductData;
    return Scaffold(
     appBar: AppBar(
       surfaceTintColor: Colors.transparent,
       centerTitle: true,
       elevation: 0,
       title: const Text("Product Details"),
       backgroundColor: Colors.transparent,
       foregroundColor: AppColors.backgroundcolor,
       titleTextStyle: TextStyle(
         fontSize: 20 , color: AppColors.backgroundcolor
       ),
       actions: [
         IconButton(
           padding: EdgeInsets.zero,
             onPressed: (){},
             icon: Icon(Icons.search)),
         IconButton(
             padding: EdgeInsets.zero,
             onPressed: (){},
             icon: Icon(Icons.shopping_cart)),
       ],
     ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 8.h) ,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.greycolor, width: 2),
            ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(args.imageCover??"",
                fit: BoxFit.cover,
                height: 300.h,
                width: double.infinity,),
              ),
            ),
            SizedBox(height: 24.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Expanded(
                   child: Text(
                     args.title??"",style: TextStyle(
                     fontSize: 18 , color: AppColors.textcolor ,
                     fontWeight: FontWeight.w500),)
               ),
                Text(
                  "EGP ${args.price}",
                  style: TextStyle(
    fontSize: 18 , color: AppColors.textcolor ,
    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w , vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(color: AppColors.backgroundcolor,width: 1)
                          ),
                          child: Text( ' Sold : ${args.sold}',
                            style: TextStyle(
                                fontSize: 18 , color: AppColors.textcolor ,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w,),
                        Icon(Icons.star , color: Colors.yellow,),
                        SizedBox(width: 4.w,),
                        Text("${args.ratingsAverage}",
                        style: TextStyle(
                            fontSize: 18 , color: AppColors.textcolor ,
                            fontWeight: FontWeight.bold
                        ),)
                      ],)),
              ],
            ),
            SizedBox(height: 10.h,),
      Text("Description", style: TextStyle(
          fontSize: 18 , color: AppColors.textcolor ,
          fontWeight: FontWeight.w500
      ),),
      SizedBox(height: 10.h,),
      ReadMoreText(
       args.description??"",
        style: TextStyle(
          fontSize: 16
        ),
        trimMode: TrimMode.Line,
        trimLines: 2,
        colorClickableText: AppColors.backgroundcolor,
        trimCollapsedText: 'Read more',
        trimExpandedText: 'Read less',
        moreStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold,
        color: AppColors.textcolor),
      ),
            SizedBox(height: 120.h,),
            Row(
              children: [
                Column(
                  children: [
                    Text("Total Price",style: TextStyle(
                        fontSize: 20 , color: AppColors.backgroundcolor ,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5.h,),
                    Text(
                      'EGP ${args.price}',style: TextStyle(
                        fontSize: 18 , color: AppColors.textcolor ,
                        fontWeight: FontWeight.bold
                    ),
                    )
                  ],
                ),
                SizedBox(width: 32.w,),
                Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.backgroundcolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.add_shopping_cart_outlined),
                      Text("Add To Cart",style: TextStyle(
                        fontSize: 18
                      ),)
                        ],
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    ) ,
    );
  }
}
