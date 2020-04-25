import 'package:covidtracker/constant.dart';
import 'package:covidtracker/pmfundsite.dart';
import 'package:covidtracker/widgets/MyHeader.dart';
import 'package:flutter/material.dart';
class Donate extends StatelessWidget {
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
              
              padding: EdgeInsets.symmetric(horizontal: 40),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('assets/images/pm.webp',height: 230)),
                                    SizedBox(height: 10,),

                  Text(
                    "In this unprecedented challenge due to COVID-19, the Government of India has created the Prime Minister's Citizen Assistance and Relief in Emergency Situations Fund (PM CARES Fund) to address the COVID-19 situation in the country. This fund will be used for combating, containment and relief efforts against the coronavirus outbreak and similar such situations in the future."
                 , style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,)

                  ),
                  SizedBox(height: 10,),
                  Center(
                    
                  child: FlatButton(
                    color: Colors.deepOrange,
              child: Text("Click to Donate",),textColor: Colors.white,
              onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => pmfundsite(
              title: "Donate PM Fund",
              selectedUrl: "https://pmnrf.gov.in/en/online-donation",
            )));

              },
        ),),
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