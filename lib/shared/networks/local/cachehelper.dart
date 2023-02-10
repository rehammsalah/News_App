import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cache{

  static SharedPreferences sharedprefrence ;
  static  init() async
  {

    sharedprefrence = await SharedPreferences.getInstance();

  }
  static Future<bool> putdata({
    @required String key,
    @required bool value,
}) async
  {

   return  await sharedprefrence.setBool(key, value);

  }

  static bool getdata({
    @required String key,
  })
  {

    return sharedprefrence.getBool(key);

  }



}