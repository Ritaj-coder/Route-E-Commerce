
import 'package:flutter/material.dart';

import '../app_colors.dart';
class HomeAppl extends StatelessWidget {
  String imagep ;
  String data ;
  HomeAppl({required this.imagep , required this.data});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: MediaQuery.of(context).size.height*0.45,
         width:  MediaQuery.of(context).size.width*0.50,
         child: Column(
           children: [
             Image.asset(imagep,
               fit:BoxFit.cover,
               height: MediaQuery.of(context).size.height*0.23 ,
               width:  MediaQuery.of(context).size.width*0.40,),
             Text(data , style: TextStyle(
                 fontSize: 20 , fontWeight: FontWeight.bold ,
                 color: AppColors.textcolor
             ),)
           ],
         ),
      ),
    );
  }
}
