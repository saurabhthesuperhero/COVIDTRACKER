import 'package:covidtracker/constant.dart';
import 'package:covidtracker/pmfundsite.dart';
import 'package:covidtracker/widgets/MyHeader.dart';
import 'package:flutter/material.dart';
class mental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                  image: "assets/icons/Drcorona.svg",
            textTop: "We can Support",
            textBottom: "by donating.",
              ),
               Padding(
              
              padding: EdgeInsets.symmetric(horizontal: 35),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('assets/images/coping-with-stress-1.jpg',)),
                                    SizedBox(height: 10,),

               
                  SizedBox(height: 10,),
                  
                          Center(
              child: Text(
            'WE ARE TOGETHER IN THE FIGHT\n  MADE WITH ❤️ BY SAURABH',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
           Center(
              child: Text(
            'Therealsaurabh.com',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          )),
          
          

          
          SizedBox(
            height: 30,
          )

                  
                  ],

              ),),
            ],
          ),

      ),
      
    );
  }
}