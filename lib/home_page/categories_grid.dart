import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route/app_colors.dart';

class Categories extends StatelessWidget {
  String imagePath ;
  String name1 ;
  String name2 ;
  Categories({required this.imagePath ,required this.name1 ,
   this.name2 = '' , });

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: (){},
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
            Text(name1 , style: TextStyle(
              fontSize: 20 , fontWeight: FontWeight.bold ,
              color: AppColors.textcolor
            ),),
            Text(name2 , style: TextStyle(
                fontSize: 20 , fontWeight: FontWeight.bold ,
                color: AppColors.textcolor
            ),)
          ],
        ),
      ),
    );
  }
}
