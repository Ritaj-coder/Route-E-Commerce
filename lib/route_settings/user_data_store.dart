
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';

class UserDataStorage extends StatelessWidget {

String label ;
UserDataStorage({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.whitecolor,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: AppColors.backgroundcolor)
        ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label , style: TextStyle(
          fontSize: 22 , fontWeight: FontWeight.bold , color: AppColors.backgroundcolor
        ),),),

    );
  }
}
