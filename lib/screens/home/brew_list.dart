import 'package:brew_crew/model/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  

  @override
  Widget build(BuildContext context) {
    final  brew = Provider.of<List<Brew>>(context);
    brew.forEach((brew) { 
      print(brew.name);
      print(brew.sugar);
      print(brew.strength);
    });
    return Container(
      
    );
  }
}