import 'package:Azkar/layout/azkar_layout.dart';
import 'package:Azkar/layout/cubit/cubit.dart';
import 'package:Azkar/layout/cubit/states.dart';
import 'package:Azkar/shared/networks/local/cachehelper.dart';
import 'package:Azkar/shared/networks/remote/dio_helper.dart';
import 'package:Azkar/shared/styles/block observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  diohelper.init();
  await cache.init();
  bool isDark = cache.getdata(key: 'isDark');

  runApp(MyApp(isDark));


}
class MyApp extends StatelessWidget
{

  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
        create:(BuildContext context)=> cubitazkarone()..changemode(shared : isDark,),),
          BlocProvider(
    create: (BuildContext context) => cubitazkar()..getfamily(),),
          BlocProvider(
    create: (BuildContext context) => cubitazkartwo(),)
        ],

        child: BlocConsumer<cubitazkarone,azkarone>(
        listener: (context, state) => {},
        builder: (context, state) =>MaterialApp(

        theme :ThemeData(
        textTheme: TextTheme(
        bodyText1:TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600
        )
        ),
        primarySwatch: Colors.deepOrange,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrange,

        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
        textTheme: TextTheme(
    subtitle1: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,

    ),
    ),
    color: Colors.white,
    iconTheme: IconThemeData(
    color: Colors.black,

    ),),
    ),
    darkTheme: ThemeData(

    textTheme: TextTheme(
    bodyText1:TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600
    )
    ),
    scaffoldBackgroundColor:HexColor('333739'),
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.white,
    backgroundColor: HexColor('333739'),

    ),
    appBarTheme: AppBarTheme(
    color: HexColor('333739'),
    iconTheme: IconThemeData(
    color: Colors.white,

    ),
    textTheme: TextTheme(
    subtitle1: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,

    ),
    ),


    ),

    ),
    themeMode: cubitazkarone.get(context).isDark == true ? ThemeMode.light : ThemeMode.dark,
    title: 'reham',
    home: azkarscreen(),
    debugShowCheckedModeBanner: false,
    ),

    ),
    );



  }


}
