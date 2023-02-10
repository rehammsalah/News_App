import 'package:Azkar/layout/cubit/cubit.dart';
import 'package:Azkar/layout/cubit/states.dart';
import 'package:Azkar/modules/search.dart';
import 'package:Azkar/shared/components/components.dart';
import 'package:Azkar/shared/networks/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class azkarscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitazkar,azkar>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = cubitazkar.get(context);
          return  Scaffold(

            appBar: AppBar(

              actions: [
                IconButton(
                  icon:Icon(Icons.search) ,
                  onPressed:(){

                    nav(context,searchscreen());
                    //cubitazkartwo.get(context).getsearch('egypt');

                },),


              ],
            leading: IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  cubitazkarone.get(context).changemode();
                }),

            title:Center(child: Text('NEWS')),
            ),

            body: cubit.screens[cubit.bottun],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.bottun,
              items: cubit.bottunItem,
              onTap: (index)
              {

                cubit.change(index);
              },

            ),




          );


        },

      );

  }
}

