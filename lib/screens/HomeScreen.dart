import 'dart:convert';

import 'package:dogs_lucas/helpers/constants.dart';
import 'package:dogs_lucas/models/dogs.dart';
import 'package:flutter/material.dart';
import 'package:dogs_lucas/helpers/api_helper.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
HomeScreen({required this.title});

  final String title;

  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<HomeScreen> {

  List<String> dogsBreedList = [];
  List<String> tempList = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchDogsBreed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _searchBar(),
                Expanded(
                  flex: 1,
                  child: _mainData(),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget _searchBar(){
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Busca la raza que desees",
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (text){
          _filterDogList(text);
        },
      ),
    );
  }

  // void searchBreeds(string query) {
  //   final breeds = tempList.where(() {

  //   });
  // }

  Widget _mainData(){
    return Center(
      child: isLoading?
      CircularProgressIndicator():
      ListView.builder(
          itemCount: dogsBreedList.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(dogsBreedList[index],)
            );
          }),
    );
  }

  _filterDogList(String text) {
    if(!text.isNotEmpty){
      setState(() {
        _fetchDogsBreed();
      });
    }
    else{
      final List<String> filteredBreeds = [];
      tempList.map((breed){
        if(breed.contains(text.toString().toUpperCase())){
          filteredBreeds.add(breed);
        }
      }).toList();
      setState(() {
        dogsBreedList.clear();
        dogsBreedList.addAll(filteredBreeds);
      });
    }
  }
  
  _fetchDogsBreed() async{
    setState(() {
      isLoading = true;
    });
    tempList = [];
    var url = Uri.parse(Constants.apiAllURL);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      jsonResponse['message'].forEach((breed,subbreed){
        tempList.add(breed.toString().toUpperCase());
      });
    }
    else{
      throw Exception("Error al cargar las razas");
    }
    setState(() {
      dogsBreedList = tempList;
      isLoading = false;
    });
  }
}