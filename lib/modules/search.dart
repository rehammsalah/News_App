

import 'package:Azkar/layout/cubit/cubit.dart';
import 'package:Azkar/layout/cubit/states.dart';
import 'package:Azkar/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class searchscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return  BlocConsumer<cubitazkartwo,azkartwo>(
        builder: (context,state){
          var searchcontrol = TextEditingController();
          var list = cubitazkartwo.get(context).search;
          var count =list.length;
    return Scaffold(

    appBar: AppBar(),
    body: Column(
    children: [


    Padding(
    padding: const EdgeInsets.fromLTRB(20.0,40.0,20.0,20.0),
    child: TextFormField(

    decoration: InputDecoration(
    labelText: 'SEARCH',
    prefixIcon: Icon(Icons.search),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0.0)
    ),
    enabledBorder:  OutlineInputBorder(

    borderRadius: BorderRadius.circular(0.0)
    )


    ),
    controller: searchcontrol ,
    validator: (String value){
    if(value.isEmpty)
    return'Search must not be empty';
    else
    return null;

    },
      onFieldSubmitted:(value) => cubitazkartwo.get(context).getsearch(value),




    ),
    ),

    list.isEmpty? Container() :  Expanded(
      child: listv(context,list,count),
    )



    ],
    ),
    );
    },
      listener:(context,state){} ,
    );}
}
