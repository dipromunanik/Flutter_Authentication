import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_firebase/auth/login.dart';
import 'package:registration_firebase/deshboard_design.dart';
import 'package:registration_firebase/model/model_class.dart';

import '../custom_design/custom_button_design.dart';
import '../custom_design/custom_textfield_design.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
final _auth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _ConfirmPassword = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();


class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/applogo.png',
                      height: 100, width: 300),
                ),
                Column(
                  children: const [
                    Text(
                      'Find, Discover, Choose and Buy',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald'
                      ),
                    ),
                    Text(
                      'anything from Online',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/user.png',height: 80,width: 80,),
                    const SizedBox(width: 10),
                    const Text('Registration',style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'
                    ),)
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    label_text: 'Email',
                    hint_text: 'Email address*',
                    obscure: false,
                    controller: _emailController),
                const SizedBox(height: 10),
                CustomTextField(
                    label_text: 'Password',
                    hint_text: 'Password*',
                    obscure: true,
                    controller: _passwordController),
                const SizedBox(height: 10),
                CustomTextField(
                    label_text: 'Confirm password',
                    hint_text: 'Confirm password*',
                    obscure: true,
                    controller: _ConfirmPassword),
                const SizedBox(height: 10),
                CustomTextField(
                    label_text: 'Name',
                    hint_text: 'User name',
                    obscure: false,
                    controller: _userNameController),
                const SizedBox(height: 10),
                CustomTextField(
                    label_text: 'Age',
                    hint_text: 'Age',
                    obscure: false,
                    controller: _ageController),
                const SizedBox(height: 10,),
                CustomTextField(
                    label_text: 'Phone',
                    hint_text: 'Phone number',
                    obscure: false,
                    controller: _phoneNumberController),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 20,
                        fontFamily: 'Lobster-Regular',
                        color: Color.fromRGBO(54, 69, 79, 5)
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: (){
                    _SignUp(_emailController.text,_passwordController.text,context);
                  },
                  button_text: 'Registration',
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account?",
                      style: TextStyle(fontSize: 18,
                          fontFamily: 'Lobster-Regular',
                          color: Color.fromRGBO(54, 69, 79, 5)
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _SignUp(String email,String password,context) async{
    if(_formkey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            saveInformation(),
            Fluttertoast.showToast(msg: 'Registration Successful'),
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeshBoard()))
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  void saveInformation() async {
   FirebaseFirestore firestore = FirebaseFirestore.instance; 

    User? user = _auth.currentUser;

    ModelUser modelUser = ModelUser();
    modelUser.uid=user!.uid;
    modelUser.email=_emailController.text;
    modelUser.phone=_phoneNumberController.text;
    modelUser.age=_ageController.text;
    modelUser.name=_userNameController.text;

    await firestore.collection("users").doc(user.uid).set(modelUser.toMap());
    Fluttertoast.showToast(msg: 'DataSave Successful');
  }

}
