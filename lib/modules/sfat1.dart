import 'package:Azkar/layout/cubit/cubit.dart';
import 'package:Azkar/layout/cubit/states.dart';
import 'package:Azkar/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sfatonescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<cubitazkar,azkar>(
      builder: (context,state){
        var list =cubitazkar.get(context).sport;
        return ConditionalBuilder(

          condition: list.length>0,

          builder: (context){

            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index) => item(list[index],context),
              separatorBuilder: (context,index)=>Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              itemCount: 10,
            );
          },
          fallback:(context) => Center(
            child:CircularProgressIndicator(),
          ) ,
        );


      },
      listener: (context,state){},



    );
  }
}