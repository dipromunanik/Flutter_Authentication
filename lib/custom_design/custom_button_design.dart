// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String button_text;
  VoidCallback onPressed;
  CustomButton({Key? key,required this.button_text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 380,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey,
                  spreadRadius: 2,
                  offset: Offset(0, 9)),
            ],
            gradient: const LinearGradient(
                colors: [Colors.deepOrange, Colors.pinkAccent])),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
                child: Text(
                  button_text,
                  style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ))),
      ),
    );;
  }
}
