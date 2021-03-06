import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/model/user.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
  

    //return either Home or Authenticate widget
    if (user == null) {
      return Autenticate();
    } else {
      return Home();
    }
    

  }
}