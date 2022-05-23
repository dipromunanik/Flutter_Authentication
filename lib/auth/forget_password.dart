import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_firebase/custom_design/custom_textfield_design.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _ForgetPasswordState extends State<ForgetPassword> {

  final _formKey = GlobalKey<FormState>();
  final _emailController =TextEditingController();
  var email ='';

  @override
  void dispose() {
   _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Receive an email to',style: TextStyle(color: Colors.black54,fontSize: 25)),
              Text('reset your password',style: TextStyle(color: Colors.black54,fontSize: 25)),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter email';
                  }else if(!value.contains('@')){
                    return 'Please enter valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.grey
                    )
                  )
                ),
              ),
              ElevatedButton(onPressed: (){

                if(_formKey.currentState!.validate()){
                  setState(() {
                    email =_emailController.text;
                  });
                  resetPassword();
                }

              }, child: Text('Send Email',style: TextStyle(
                color: Colors.orange
              ),))
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword() async {
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         backgroundColor: Colors.deepOrange,
           content:
       Text(
         'Password Reset Email has been send !',style: TextStyle(
         fontSize: 18
       ),
       )),
     );
   }on FirebaseAuthException catch(e){
     if(e.code=='user not found'){
       SnackBar(
           backgroundColor: Colors.deepOrange,
           content:
           Text(
             'User not found for that email',style: TextStyle(
               fontSize: 18
           ),
           ));
     }
   }
  }


}
