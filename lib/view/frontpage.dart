import 'package:demologinfionan/controller/frontpage_controller.dart';
import 'package:demologinfionan/model/user.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return FrontPageState();
  }

}
class FrontPageState extends State<FrontPage>{
  FrontPageController controller;
  BuildContext context;
  var user = User();
  var formKey = GlobalKey<FormState>();
  FrontPageState(){
    controller = FrontPageController(this);

  }

  void stateChanged(Function fn){
    setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Demo for Login page'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.people),
            label: Text("Create Account"),
            textColor: Colors.white,
            onPressed: controller.creatAccount,
          ),

        ],
        
        ),
        body: Form(
          key: formKey,
          child:ListView(
            children: <Widget>[
              TextFormField(
                initialValue: user.email,
                decoration: InputDecoration(
                  labelText: 'Enter email as login name',
                  hintText: 'email',
                ),
                keyboardType:  TextInputType.emailAddress,
                validator: controller.validateEmail,
                onSaved: controller.savedEmail,
              ),

               TextFormField(
                initialValue: user.password,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  hintText: 'password',
                ),
                keyboardType:  TextInputType.emailAddress,
                validator: controller.validatePassword,
                onSaved: controller.savedPassword,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: controller.login, 
              ),
            ],
          )
        )
      );
    
  }

}