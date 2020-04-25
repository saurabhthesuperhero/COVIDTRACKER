import 'package:covidtracker/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Statewise extends StatefulWidget {
  @override
  _StatewiseState createState() => _StatewiseState();
}

class _StatewiseState extends State<Statewise> {
  List countryData;
  var temp;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest/data/regional');
    setState(() {
      temp = json.decode(response.body);
      countryData=temp['data']['regional'];
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.indigo,
        title: Text('Statewise Stats'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                     decoration:BoxDecoration(
          
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
            ,colors: [
              Colors.indigo,Colors.indigoAccent,
              ],
              ),
           


        ),
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          
                          width: 180,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countryData[index]['loc'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'CONFIRMED:' +
                                    countryData[index]['totalConfirmed'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                          
                              Text(
                                'RECOVERED:' +
                                    countryData[index]['discharged'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                'DEATHS:' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
