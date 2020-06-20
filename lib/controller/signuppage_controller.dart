import 'package:demologinfionan/controller/myfirebase.dart';
import 'package:demologinfionan/view/mydialog.dart';
import 'package:demologinfionan/view/signuppage.dart';
import 'package:flutter/material.dart';

class SignUpPageController {
  SignUpPageState state;
  SignUpPageController(this.state);

  String validateEmail(String value) {
    if(value == null || !value.contains('.')|| !value.contains('@')){
      return ('Enter a valid email address');
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

  

  String validateName(String value) {
    if(value.length == 0 ){
      return('Enter your display name');
    }
    return null;
  }

  void savedName(String value) {
    state.user.displayName = value;
  }

  void createAccount() async {
    if(!state.formKey.currentState.validate()){
      return;
    }
    state.formKey.currentState.save();
    try{
      state.user.uid = await MyFirebase.createAccount(
      email: state.user.email,
      password: state.user.password
      );

      

    }catch(e){
      MyDialog.info(
        context: state.context,
        title: 'Account creation failed',
        message: e.message !=null ? e.message : e.toString(),
        action: () => Navigator.pop(state.context),
      );
      return;   //Stop, do not proceed
    }


    //Create profile collection
    try{
    MyFirebase.createProfile(state.user);
    } catch(e) {
       state.user.displayName = null;
       
    }
      MyDialog.info(
        context: state.context,
        title: 'Account created successful!',
        message: 'New account created with '+ state.user.email,
        action: () => Navigator.pop(state.context),
      );
   
  }
  
}