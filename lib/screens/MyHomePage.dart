import 'dart:convert';

import 'package:dogs_lucas/helpers/constants.dart';
import 'package:dogs_lucas/models/dogs.dart';
import 'package:flutter/material.dart';
import 'package:dogs_lucas/helpers/api_helper.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Dogs> data = [];
  List<Map<String, dynamic>> list_dogs = [];

  Future<List<Dogs>> tomar_datos() async{
    var url = Uri.parse(Constants.apiAllURL);
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      },
    );
    var datos = jsonDecode(response.body);

    List<Dogs> Consulta = [];

    // for(datos in datos){
      Consulta.add(Dogs.fromJson(datos));
    // }
    
    list_dogs = Consulta[0].message; 
    
    return Consulta;
  }

    @override
  void initState() {
    super.initState();
    tomar_datos().then((value){
      setState((){
        data.addAll(value);
      });
    });
  }


    @override
    Widget build(BuildContext context) {
        /// Scaffold is the base for a page.
        /// It gives an AppBar for the top,
        /// Space for the main body, bottom navigation, and more.
        return Scaffold(
            /// App bar has a ton of functionality, but for now lets
            /// just give it a color and a title.
            appBar: AppBar(
                /// Access this widgets properties with 'widget'
                title: Text(widget.title),
                backgroundColor: Colors.black87,
            ),
            /// Container is a convenience widget that lets us style it's
            /// children. It doesn't take up any space itself, so it
            /// can be used as a placeholder in your code.
            body: 
              Column(children: 
                [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.blue, width: 1)
                            )
                          ),
                          child: Text('')
                        );
                      },
                    ),
                  )
                ],
              ),
        );
    }

  Future<Null> getDogs() async {
    setState() {
      //loaderComponent() = true;
    }

    List<Dogs> list_dogs = await api_helper.getAllDogs();
  } 

}

