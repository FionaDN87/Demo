import 'package:demologinfionan/controller/myfirebase.dart';
import 'package:demologinfionan/view/frontpage.dart';
import 'package:demologinfionan/view/mydialog.dart';
import 'package:demologinfionan/view/signuppage.dart';
import 'package:flutter/material.dart';

class FrontPageController{
  FrontPageState state;
  FrontPageController(this.state);

  void creatAccount() {
    Navigator.push(state.context,MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ));
  }

  String validateEmail(String value) {
    if(value == null || !value.contains('.') || !value.contains('@')){
      return 'Enter a valid email address';
    }
    return null;
  }

  void savedEmail(String value) {
    state.user.email = value;
  }

  String validatePassword(String value) {
    if(value.length <=5 || value == null){
      return('Min length of password is 6 characters');
    }
    return null;
  }

  void savedPassword(String value) {
    state.user.password = value;
  }

  void login() async {
    if(!state.formKey.currentState.validate()){
      return;
    }
    state.formKey.currentState.save();

    try{
      state.user.uid = await MyFirebase.login(
        email: state.user.email, 
        password:state.user.password);
        MyDialog.info(
        context: state.context,
        title: 'Login Success',
        message: 'Successfully login in',
        action: () => Navigator.pop(state.context),

      );
    }catch(e){
      MyDialog.info(
        context: state.context,
        title: 'Login Failed',
        message: e.messagge !=null? e.message: e.toString(),
        action: () => Navigator.pop(state.context),

      );
    }
  }
}