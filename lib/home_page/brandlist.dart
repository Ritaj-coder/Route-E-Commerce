
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/home_page/branditem.dart';
import 'package:route/home_page/category_branditem.dart';
import '../data/model/Response/BrandResponse.dart';
import '../data/model/Response/CategoryResponse.dart';

class BrandlIst extends StatelessWidget {

  List<DataBrand> brandslist ;


  BrandlIst({required this.brandslist});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return BrandItem(brands: brandslist[index],);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ,
            mainAxisSpacing: 16 ,
            crossAxisSpacing: 16
        ),
      ),

    );
  }
}
