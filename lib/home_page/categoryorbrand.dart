
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/home_page/category_branditem.dart';
import '../data/model/Response/BrandResponse.dart';
import '../data/model/Response/CategoryResponse.dart';

class CategoryOrBrand extends StatelessWidget {

  List<Data> categories ;


  CategoryOrBrand({required this.categories});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
           return CategoryOrBrandItem(categories: categories[index],);
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
