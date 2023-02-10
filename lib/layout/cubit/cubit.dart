import 'package:Azkar/layout/cubit/states.dart';
import 'package:Azkar/modules/osra.dart';
import 'package:Azkar/modules/sfat1.dart';
import 'package:Azkar/modules/sfat2.dart';
import 'package:Azkar/shared/networks/local/cachehelper.dart';
import 'package:Azkar/shared/networks/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class cubitazkarone extends Cubit <azkarone>
{
  cubitazkarone():super(initazkarone());
  static cubitazkarone get(context) => BlocProvider.of(context);

  bool isDark = false ;
  void changemode({
    bool shared
  })
  {
    if(shared!=null)
      {
        isDark = shared;
        emit(changemodestate());

      }
    else
      {
        isDark = !isDark;
        cache.putdata(key:'isDark',value:isDark).then((value) => emit(changemodestate()));
        emit(changemodestate());

      }

  }


}
class cubitazkartwo extends Cubit <azkartwo> {
  cubitazkartwo() :super(initazkartwo());

  static cubitazkartwo get(context) => BlocProvider.of(context);

  List<dynamic> search=[];
  void getsearch(String value)
  {

    emit(loadingsearch());
    diohelper.getdata(
      url:'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'e2b952cffe884a92b12ba542935315c6',

      },
    ).then((value) {
      search = value.data['articles'];
      emit(successsearch());

    }).catchError((error)
    {
      print(error.toString());
      emit(errorsearch(error.toString()));

    }
    );


  }

}
class cubitazkar extends Cubit <azkar>
{
  cubitazkar():super(initazkar());
  static cubitazkar get(context) => BlocProvider.of(context);


  int bottun =0;
  List<BottomNavigationBarItem> bottunItem =[

    BottomNavigationBarItem(


        icon: Icon(
          Icons.business,

        ),
      label: 'Business',


    ),
    BottomNavigationBarItem(


      icon: Icon(
        Icons.sports_baseball,

      ),
      label: 'Sports',


    ),
    BottomNavigationBarItem(


      icon: Icon(
        Icons.science,

      ),
      label: 'Science',


    ),


  ];
  List<Widget> screens =[

    osrascreen(),
    sfatonescreen(),
    sfattwoscreen(),



  ];


  void change (int index)
  {
    bottun =index;
    emit(buttonazkar());
    if(index==1)
      getsport();
    else if(index==2)
      getscience();

  }


  List<dynamic> family=[];
  void getfamily()
  {
    emit(loading());
    if(family.length==0)
      {
        diohelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'e2b952cffe884a92b12ba542935315c6',

          },
        ).then((value) {
          family = value.data['articles'];
          emit(success());

        }).catchError((error)
        {
          print(error.toString());
          emit(error(error.toString()));

        }
        );
      }
    else
      {
        emit(success());
      }


  }


  List<dynamic> sport=[];
  void getsport()
  {
    emit(loadingsport());
    if(sport.length==0)
      {
        diohelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'e2b952cffe884a92b12ba542935315c6',

          },
        ).then((value) {
          sport = value.data['articles'];
          emit(successsport());

        }).catchError((error)
        {
          print(error.toString());
          emit(errorsport(error.toString()));

        }
        );
      }
    else
      {
        emit(successsport());
      }


  }


  List<dynamic> science=[];
  void getscience()
  {
    emit(loadingscience());
    if(science.length==0)
      {
        diohelper.getdata(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'e2b952cffe884a92b12ba542935315c6',

          },
        ).then((value) {
          science = value.data['articles'];
          emit(successscience());

        }).catchError((error)
        {
          print(error.toString());
          emit(errorscience(error.toString()));

        }
        );
      }
    else
      {
        emit(successscience());
      }


  }




}