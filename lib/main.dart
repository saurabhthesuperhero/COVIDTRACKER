import 'dart:convert';
import 'package:covidtracker/Donate.dart';
import 'package:covidtracker/about.dart';
import 'package:covidtracker/constant.dart';
import 'package:covidtracker/infopanel.dart';
import 'package:covidtracker/statewise.dart';
import 'package:covidtracker/widgets/MyHeader.dart';
import 'package:covidtracker/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import   'package:http/http.dart' as http;

import 'all_country.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19 Tracker',
      theme: ThemeData(
       
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor),)
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
Map worlddata;
Map indiadata;
fetchworlddata()async{
  http.Response response=await http.get("https://corona.lmao.ninja/v2/all");
    http.Response response1=await http.get("https://corona.lmao.ninja/v2/countries/india");

   setState(() {
     worlddata=json.decode(response.body);
              indiadata=json.decode(response1.body);

   });
}


@override
  void initState() {
    // TODO: implement initState
    fetchworlddata();
    super.initState();
        
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:indiadata == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          :
      SingleChildScrollView(
              child: Column(
          children: <Widget>[
        MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textBottom: "is stay at home.",
        ),
        Container(
          height: 62,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical:20,horizontal: 20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color:Color(0xFFE5E5E5),),
          ),
                  child: Text("Stay Updated, Stay Safe",style:TextStyle(color: Colors.pink,
              fontWeight: FontWeight.w600,fontSize: 15),
              ),
        ),
        SizedBox(height: 20,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[RichText(text: TextSpan(
                children: [TextSpan(text: "World wide update\n",style:kTitleTextstyle,
                ),
                TextSpan(text:"Newest update Today",style:TextStyle(color: kTextLightColor,),
                ),
                ],
              ),
              ),
              Spacer(),
             
              ],
            ),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){

                      return CountryPage();
                    },),);

              },
                          child: Container(
                padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(offset:Offset(0,4),
              blurRadius: 30,
              color: kShadowColor,


              ),
              ],

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Counter(color: kInfectedColor,
                  number: worlddata['active'],
                  title: "Infected",)
                  ,
                  Counter(color: kDeathColor,
                  number: worlddata['deaths'],
                  title: "Deaths",)
                  ,
                  Counter(color: kRecovercolor,
                  number: worlddata['recovered'],
                  title: "Recovered",)
                  ,
                ]
              ),
              
              ),
            ),
                  //testuing.....
                              SizedBox(height: 20,),

                   Row(
              children: <Widget>[RichText(text: TextSpan(
                children: [TextSpan(text: "India update\n",style:kTitleTextstyle,
                ),
                TextSpan(text:"Newest update Today",style:TextStyle(color: kTextLightColor,),
                ),
                ],
              ),
              ),
              Spacer(),
               GestureDetector(
                onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return Statewise();
                    },),);

                },
                          child: Text("State wise update",style:TextStyle(color: kPrimaryColor,
              fontWeight: FontWeight.w600),
              ),
            ),
              ],
            ),

            SizedBox(height: 20,),
            GestureDetector(
               onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return Statewise();
                    },),);

                },
                          child: Container(

                padding: EdgeInsets.all(20),
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
              color: Colors.indigoAccent,
              boxShadow: [BoxShadow(offset:Offset(0,4),
              blurRadius: 30,
              color: kShadowColor,


              ),
              ],

              ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Counter(color: kInfectedColor,
                  number:indiadata['cases'],
                  title: "Infected",)
                  ,
                  Counter(color: kDeathColor,
                  number: indiadata['deaths'],
                  title: "Deaths",)
                  ,
                  Counter(color: kRecovercolor,
                  number: indiadata['recovered'],
                  title: "Recovered",)
                  ,
                ]
              ),
              
              ),
            ),


            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("Spread of Virus",style:kTitleTextstyle,
            
            ),
            GestureDetector(
                onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return CountryPage();
                    },),);

                },
                          child: Text("Country wise update",style:TextStyle(color: kPrimaryColor,
              fontWeight: FontWeight.w600),
              ),
            ),

            ],
            ),

            GestureDetector(
               onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context){

                      return CountryPage();
                    },),);

                },
                          child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                height: 178,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [BoxShadow(offset:Offset(0,10),
                blurRadius: 30,
                color: kShadowColor,
                ),
                ],

                ),
                child: Image.asset("assets/images/map.png",
                fit: BoxFit.contain,),
                ),
            ),
         InfoPanel(),
        SizedBox(
            height: 20,
          ),
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
        ),
        )

    ],

    ),
      )
    );
  }
   
}
  //notifiction
 

