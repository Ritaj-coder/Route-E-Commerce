
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route/app_colors.dart';
import 'package:route/data/model/Response/GetCartResponse.dart';
import 'package:route/route_list/cart_cubit/cart_cubit.dart';
import 'package:route/route_list/cart_cubit/cart_states.dart';
import 'package:route/route_list/cart_item.dart';

class CartScreen extends StatelessWidget {
static const String routename = 'cart';

CartviewModel viewModel = CartviewModel();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=> viewModel..getCart(),
      child: BlocBuilder<CartviewModel,CartState>(
        builder: ( context,  state) {
          return  Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Cart",style: TextStyle(color: AppColors.textcolor,
                  fontSize: 24),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: AppColors.textcolor,
                  size: 24,),
              ),
            ),
            body: state is CartSuccessState ?
            Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        return CartItem(cart: state.getcartresponse.data!.products![index],);
                      },
                      itemCount: state.getcartresponse.data!.products!.length,
                    )
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 98.h , left: 16.w , right: 16.w,top: 10.h),
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text("Total Price : ",style: TextStyle(
                                fontSize: 22 , color: AppColors.blackcolor
                            ),),),
                          Text("EGP ${state.getcartresponse.data!.totalCartPrice}"
                            ,style: TextStyle(
                              fontSize: 20 , color: AppColors.backgroundcolor
                          ),),
                        ],),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundcolor,
                                borderRadius: BorderRadius.circular(25.r),
                                border: Border.all(color: AppColors.backgroundcolor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("CheckOut",
                                  style: TextStyle(
                                  fontSize: 20 ,
                                ),),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ) :
                Center(child:CircularProgressIndicator(
                  color: AppColors.backgroundcolor,
                ),),
          );
        },

      ),
    );
  }
}
