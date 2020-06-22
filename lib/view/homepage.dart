import 'package:demologinfionan/controller/homepage_controller.dart';
import 'package:demologinfionan/model/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
@override
State<StatefulWidget> createState(){
  return HomePageState(user);
 }
}
class HomePageState extends State<HomePage>{
  User user;
  HomePageController controller;
  BuildContext context;
  HomePageState(this.user){
    controller = HomePageController(this);
  }
  void stateChanged(Function fn){
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Text('Welcome, ${user.displayName}')
    );
  }

}