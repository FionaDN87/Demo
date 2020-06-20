import 'package:demologinfionan/controller/signuppage_controller.dart';
import 'package:demologinfionan/model/user.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }

}
class SignUpPageState extends State<SignUpPage>{
  SignUpPageController controller;
  BuildContext context;
  var formKey = GlobalKey<FormState>();
  User user = User();

  SignUpPageState(){
    controller = SignUpPageController(this);

  }

  void stateChanged(Function fn){
    setState(fn);

  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),

      ),
      body: Form(
        key: formKey,
        child:ListView(
          children: <Widget>[
            TextFormField(
              initialValue: user.email,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Email as login name',
                labelText: 'enter email address',
              ),
              validator: controller.validateEmail,
              onSaved: controller.savedEmail,
            ),
            TextFormField(
              initialValue: user.password,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'enter password',
              ),
              validator: controller.validatePassword,
              onSaved: controller.savedPassword,
            ),
             TextFormField(
              initialValue: user.displayName,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'display name',
                labelText: 'enter display name',
              ),
              validator: controller.validateName,
              onSaved: controller.savedName,
            ),
            RaisedButton(
              child:Text('Create account'),
              onPressed: controller.createAccount,
              ),
          ],
            
        ),
      )
    );
  }

}