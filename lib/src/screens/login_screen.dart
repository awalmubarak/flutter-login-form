import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}


class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: formWidget(),
    );
  }


  Widget formWidget(){
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email Address",
          hintText: "you@example.com"
      ),

      validator: validateEmail,

      onSaved: (String value){
        this.email = value;
      },
    );

  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "password"
      ),

      validator: validatePassword,

      onSaved: (String value){
        this.password = value;
      },
    );
  }

  Widget submitButton(){

    return RaisedButton(
      color: Colors.lightBlue,
      textColor: Colors.white,
      child: Text("Submit"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('Time to post $email and $password to API');
        }
      },
    );

  }
}
