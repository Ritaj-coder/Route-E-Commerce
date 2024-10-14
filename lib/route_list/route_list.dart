import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/route_list/cart_screen.dart';
import 'package:route/route_list/cubit/products_cubit.dart';
import 'package:route/route_list/cubit/products_state.dart';
import 'package:route/route_list/product_details.dart';
import 'package:route/search_part.dart';
import '../app_colors.dart';
import 'category_list.dart';

class RouteList extends StatefulWidget {
  @override
  State<RouteList> createState() => _RouteListState();
}

class _RouteListState extends State<RouteList> {
 ProductsViewModel viewModel = ProductsViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductsViewModel,ProductsState>(
        builder: (context,state){
         return Scaffold(
             appBar: AppBar(
               backgroundColor: AppColors.whitecolor,
               title: Text("Route",style: TextStyle(
                   color: AppColors.textcolor , fontSize: 25
               ),),
             ),
             body: Column(
               children: [
             Padding(
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
                 backgroundColor: AppColors.backgroundcolor,
                 child: IconButton(
                     onPressed: (){
                       ///cart screen
                      Navigator.pushNamed(context, CartScreen.routename);
                     }
                     , icon: Icon(Icons.shopping_cart,size: 35,
                   color: AppColors.textcolor, )),
               )
             ],
           ),
         ),
             SizedBox(height: 20,),

                 state is ProductsSuccessState || state is AddCartSuccessState || state is FavSuccessState?
                 Expanded(
                     child: GridView.builder(
                       itemCount: viewModel.products!.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2 ,
                           childAspectRatio: 2/2.4,
                           crossAxisSpacing: 16.w,
                           mainAxisSpacing: 16.h

                         ),
                         itemBuilder: (context,index){
                         return InkWell(
                           splashColor: AppColors.backgroundcolor,
                           hoverColor: Colors.transparent,
                           highlightColor: Colors.transparent,
                           onTap: (){
                             Navigator.pushNamed(context, ProductDetails.routename,
                                 arguments : viewModel.products![index]);
                             },
                           child: ProductsList(product: viewModel.products![index]),
                         );
                         }
                     )
                 ) :
                   const  Center(
                       child: CircularProgressIndicator(
                         color: AppColors.backgroundcolor,
                       ),
                     )

               ],
             )

         );
      },

      ),
    );
  }
}
