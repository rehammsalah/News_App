import 'dart:ffi';
import 'dart:io';

import 'package:Azkar/modules/search.dart';
import 'package:Azkar/modules/web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container img(article) {
  try{
    print('${article['urlToImage']}');
    return '${article['urlToImage']}'=="null" ? Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage('assest/imgg.png'),
            fit: BoxFit.cover,

          )
      ),) :   Container(

      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),

            fit: BoxFit.cover,

          )
      ),




    );
  }
  catch(e)
  {
    print ('${e.toString()}');
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage('assest/imgg.png'),
            fit: BoxFit.cover,

          )
      ),);
  }

}

Widget item (article,context) => InkWell(

  onTap: (){

    nav(context, webscreen(article['url']));
  },

  child:   Padding(

    padding: EdgeInsets.all(20.0),

    child: Row(

        children: [



          img(article),

          Padding(padding: EdgeInsets.only(left: 20)),

          Expanded(

            child: Container(

              height: 120,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [



                   Expanded(

                     child: Text('${article['title']}',

                          style: Theme.of(context).textTheme.bodyText1,

                          maxLines: 3,

                        ),

                   ),

                  Text('${article['publishedAt']}',

                    style: TextStyle(

                      color: Colors.grey,

                        fontSize: 10,

                        ),



                  ),



                ],

              ),

            ),

          ),









        ],

      ),



  ),
);

void nav (context,Widget) => Navigator.push(

    context,
    MaterialPageRoute(
        builder:(context)=> Widget,

    )

);

Widget listv (context,list,count) => list == []? Container(height: 200 , width: 200, color: Colors.white,):ListView.separated(

physics: BouncingScrollPhysics(),
itemBuilder: (context,index) => item(list[index],context),
separatorBuilder: (context,index)=>Container(
width: double.infinity,
height: 1,
color: Colors.grey[300],
),
itemCount: count,

);