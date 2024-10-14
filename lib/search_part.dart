import 'package:flutter/material.dart';
import 'package:route/route_list/cubit/products_cubit.dart';

import 'app_colors.dart';

class SearchPart extends StatelessWidget {
  ProductsViewModel viewModel = ProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              decoration: InputDecoration(
                hintText: "What Do You Search For ?" ,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                prefixIcon: Icon(Icons.search,
                  size: 35,color: AppColors.textcolor,),
              ),
            ),
          ),
          Badge(
            label: Text(viewModel.numOfCartItem.toString()),
            child: IconButton(
                onPressed: (){}
                , icon: Icon(Icons.shopping_cart,size: 35,
              color: AppColors.textcolor, )),
          )
        ],
      ),
    );
  }
}
