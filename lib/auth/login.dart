import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_firebase/auth/forget_password.dart';
import 'package:registration_firebase/auth/signup.dart';
import 'package:registration_firebase/custom_design/custom_button_design.dart';
import 'package:registration_firebase/custom_design/custom_textfield_design.dart';
import 'package:registration_firebase/deshboard_design.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
final _auth = FirebaseAuth.instance;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();

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
                    const Text('Login',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'
                    ),)
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    label_text: 'Email',
                    hint_text: 'Email address',
                    obscure: false,
                    controller: _emailController),
                const SizedBox(height: 10),
                CustomTextField(
                    label_text: 'Password',
                    hint_text: 'Password',
                    obscure: true,
                    controller: _passwordController),
                const SizedBox(height: 10),
                 Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForgetPassword()));
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(fontSize: 20,
                          fontFamily: 'Lobster-Regular',
                          color: Color.fromRGBO(54, 69, 79, 5)
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: (){
                   _LoginPage(_emailController.text, _passwordController.text, context);
                  },
                  button_text: 'Login',
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18,
                        fontFamily: 'Lobster-Regular',
                        color: Color.fromRGBO(54, 69, 79, 5)
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Login With : ',style: TextStyle(fontSize: 20,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'Oswald'
                   ),
                   ),
                   Container(
                     height: 60,
                     width: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(180),
                       color: Colors.white,
                       border: Border.all(color: Colors.black,width: 2),
                       boxShadow: const [
                         BoxShadow(
                             blurRadius: 10,
                             color: Colors.grey,
                             spreadRadius: 2,
                             offset: Offset(0, 9)),
                       ],
                     ),
                     child: Padding(
                         padding:EdgeInsets.all(10)
                         ,child: Image.asset('assets/images/googleicon.png',width: 100,height: 100)),
                   ),
                   Container(
                     height: 60,
                     width: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(180),
                       color: Colors.white,
                       border: Border.all(color: Colors.black,width: 2),
                       boxShadow: const [
                         BoxShadow(
                             blurRadius: 10,
                             color: Colors.grey,
                             spreadRadius: 2,
                             offset: Offset(0, 9)),
                       ],
                     ),
                     child: Padding(
                         padding:EdgeInsets.all(10)
                         ,child: Image.asset('assets/images/facebook.png',width: 60,height: 60)),
                   ),
                   Container(
                     height: 60,
                     width: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(180),
                       color: Colors.white,
                       border: Border.all(color: Colors.black,width: 2),
                       boxShadow: const [
                         BoxShadow(
                             blurRadius: 10,
                             color: Colors.grey,
                             spreadRadius: 2,
                             offset: Offset(0, 9)),
                       ],
                     ),
                     child: Padding(
                         padding:EdgeInsets.all(10)
                         ,child: Image.asset('assets/images/twitter.png',width: 100,height: 100)),
                   ),
                 ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _LoginPage(String email,String password,context) async {
    if(_formkey.currentState!.validate()) {

      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            Fluttertoast.showToast(msg: 'Login Successful'),
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DeshBoard()))
      }
      ).catchError((e){
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }
}
