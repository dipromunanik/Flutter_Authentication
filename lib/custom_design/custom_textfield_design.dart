import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomTextField extends StatefulWidget {

  String label_text;
  String hint_text;
  bool obscure;
  TextEditingController controller;

  CustomTextField({Key? key,required this.label_text,required this.hint_text,required this.obscure,required this.controller}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}
String PasswordStore='';
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
        if(value.isEmpty){
          return 'Field can not be an empty';
        }
        if(widget.label_text=='Email'){
          if(!emailValid){
            return 'Email format is not correct';
          }
        }
        if(widget.label_text=='Password'){
          PasswordStore=value;
          if(value.length<6){
            return 'Password will be minimum 6 character!';
          }
        }
        if(widget.label_text=="Confirm password"){
          if(PasswordStore!=value){
           return 'Password did not match!';
          }
        }
      },
      obscureText: widget.obscure,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label_text,
        hintText: widget.hint_text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2,
                color: Colors.lightBlueAccent
            ),
            borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}
