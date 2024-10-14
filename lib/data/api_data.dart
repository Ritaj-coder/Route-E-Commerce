import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:route/data/api_name.dart';
import 'package:route/data/endpoints.dart';
import 'package:route/data/failures.dart';
import 'package:route/data/model/Request/LoginRequest.dart';
import 'package:route/data/model/Response/AddToCartResponse.dart';
import 'package:route/data/model/Response/AddToWishListResponse.dart';
import 'package:route/data/model/Response/BrandResponse.dart';
import 'package:route/data/model/Response/CategoryResponse.dart';
import 'package:route/data/model/Response/GetCartResponse.dart';
import 'package:route/data/model/Response/GetWishListResponse.dart';
import 'package:route/data/model/Response/LoginResponse.dart';
import 'package:route/data/model/Request/RegisterRequest.dart';
import 'package:route/data/model/Response/ProductResponse.dart';
import 'package:route/data/model/Response/RegisterResponse.dart';
import 'package:route/shared_preferences.dart';

class ApiManager {
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
  */
static Future<RegisterResponse> register (
    String name ,
    String email,
    String password,
    String repassword ,
    String phone) async {
  Uri url  = Uri.https(ApiName.baseURL,EndPoints.signup);
  var registerRequest = RegisterRequest(
    name: name,
     email:email ,
    password: password,
    rePassword: repassword,
    phone: phone
  );
  try {
    var response = await http.post(url, body: registerRequest.toJson());

    var bodyString = response.body;   ///String
    var json = jsonDecode(bodyString);  ///turn it to json
    return RegisterResponse.fromJson(json);
  } catch(e){
    throw e ;
  }

  /// SUMMARIZE PAST THREE LINES
  // RegisterRequest.fromJson(jsonDecode(response.body));
}

static Future<LoginResponse> login (String email , String password) async {
 Uri url = Uri.https(ApiName.baseURL , EndPoints.login);
var loginRequest = LoginRequest(email: email, password: password);

try {
  var response = await http.post(url, body: loginRequest.toJson());
 var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
 SharedPreferenceutils.SaveData(key: 'token', value: loginResponse.token);
return loginResponse ;
}
catch(e){
  throw e ;
}

}

static Future<CategoryResponse> getAllCategories()async{
  Uri url = Uri.https(ApiName.baseURL ,EndPoints.Category );
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return CategoryResponse.fromJson(json);
  } catch(e){
    throw e ;
  }
}

static Future<BrandResponse> getAllBrands()async{
  Uri url = Uri.https(ApiName.baseURL ,EndPoints.Brand );
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return BrandResponse.fromJson(json);
  } catch(e){
    throw e ;
  }
}

static Future<ProductResponse> getAllProducts()async{
  Uri url = Uri.https(ApiName.baseURL ,EndPoints.Product );
  try {
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return ProductResponse.fromJson(json);
  } catch(e){
    throw e ;
  }
}

static Future<Either<Failures,AddToCartResponse>> addToCart (String productId) async {
  Uri url = Uri.https(ApiName.baseURL , EndPoints.addtocart);

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.post(url, body: {
      'productId': productId
    }, headers: {
      'token' : token.toString()
    });
    var addtocartResponse = AddToCartResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(addtocartResponse) ;
    }
    else if (response.statusCode == 401){
     return Left(ServerError(errorMessage: addtocartResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: addtocartResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,GetCartResponse>> getCart () async {
  Uri url = Uri.https(ApiName.baseURL , EndPoints.addtocart);

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.get(url, headers: {
      'token' : token.toString()
    });
    var getcartResponse = GetCartResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(getcartResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: getcartResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: getcartResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,GetCartResponse>> deleteCart (String productId) async {
  Uri url = Uri.https(ApiName.baseURL , '${EndPoints.addtocart}/$productId');

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.delete(url, headers: {
      'token' : token.toString()
    });
    var deleteItemInCartResponse = GetCartResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(deleteItemInCartResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: deleteItemInCartResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: deleteItemInCartResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,GetCartResponse>> updateCountCart (String productId , int count) async {
  Uri url = Uri.https(ApiName.baseURL , '${EndPoints.addtocart}/$productId');

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.put(url, body: {
      'count'  : '$count'
    },
        headers: {
      'token' : token.toString()
    });
    var updateCountInCartResponse = GetCartResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(updateCountInCartResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: updateCountInCartResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: updateCountInCartResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,AddToWishListResponse>> addToWishList (String productId) async {
  Uri url = Uri.https(ApiName.baseURL , EndPoints.addtowishlist);

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.post(url, body: {
      'productId': productId
    }, headers: {
      'token' : token.toString()
    });
    var addtowishlistResponse = AddToWishListResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(addtowishlistResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: addtowishlistResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: addtowishlistResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,GetWishListResponse>> getWishList () async {
  Uri url = Uri.https(ApiName.baseURL , EndPoints.addtowishlist);

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.get(url, headers: {
      'token' : token.toString()
    });
    var getwishlistResponse = GetWishListResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(getwishlistResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: getwishlistResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: getwishlistResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}

static Future<Either<Failures,GetWishListResponse>> deleteWishList (String productId) async {
  Uri url = Uri.https(ApiName.baseURL , '${EndPoints.addtowishlist}/$productId');

  try {
    var token = SharedPreferenceutils.GetData(key: 'token');
    var response = await http.delete(url, headers: {
      'token' : token.toString()
    });
    var deleteItemInWishListResponse = GetWishListResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode < 300){
      return Right(deleteItemInWishListResponse) ;
    }
    else if (response.statusCode == 401){
      return Left(ServerError(errorMessage: deleteItemInWishListResponse.message!));
    }
    else {
      return Left(ServerError(errorMessage: deleteItemInWishListResponse.message!));
    }
  }
  catch(e){
    return Left(ServerError(errorMessage: e.toString()));

  }

}


}

