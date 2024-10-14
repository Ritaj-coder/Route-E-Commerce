import 'package:cached_network_image/cached_network_image.dart';
import 'package:route/data/model/Response/CategoryResponse.dart';
import 'package:route/home_page/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';

import '../data/model/Response/BrandResponse.dart';
class BrandItem extends StatelessWidget {
  ///todo: model

  DataBrand brands ;
  BrandItem({required this.brands});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: brands.image ?? '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              backgroundImage: NetworkImage(brands.image ?? ''),
              radius: 70,
            )
        ),
        SizedBox(height: 8.h,),
        Expanded(
            flex: 2,
            child: Text(
              brands.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20 , color: AppColors.textcolor ,
                  fontWeight: FontWeight.normal
              ),
            )
        )
      ],
    );
  }
}
