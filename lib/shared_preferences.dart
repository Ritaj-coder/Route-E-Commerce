
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceutils {
 static late SharedPreferences sharedpreference ;

 static init()async{
   sharedpreference= await SharedPreferences.getInstance();
 }

 static Future<bool> SaveData({required String key ,
   required dynamic value}){
  if(value is int){
    return sharedpreference.setInt(key, value);
  }else if (value is double){
    return sharedpreference.setDouble(key, value);
  }else if (value is String){
    return sharedpreference.setString(key, value);
  }else {
    return sharedpreference.setBool(key, value);
  }
 }

 static Object? GetData({required String key}){
   return sharedpreference.get(key);
 }

 static Future<bool> RemoveData({required String key})async{
   return await sharedpreference.remove(key);
 }
}