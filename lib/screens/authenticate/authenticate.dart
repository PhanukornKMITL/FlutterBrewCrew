import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Autenticate extends StatefulWidget {
  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
  }
}