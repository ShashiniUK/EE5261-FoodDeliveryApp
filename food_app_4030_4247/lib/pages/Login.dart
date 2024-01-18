import 'package:flutter/material.dart';
import 'package:food_app_4030_4247/pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app_4030_4247/pages/bottomnav.dart';
import 'package:food_app_4030_4247/pages/forgotpassword.dart';
import 'package:food_app_4030_4247/widget/widget_support.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";

  final _formkey= GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ])),
          ),
          Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Text(""),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0,),
            child: Column(children: [
              Center(
                child: Image.network(

                  "https://static.wixstatic.com/media/abe7c5_16495b89a2714112abe66dbbdf88df06~mv2_d_3300_1770_s_2.png/v1/fill/w_560,h_300,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Color%20logo%20-%20no%20background.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/5,
                  fit: BoxFit.cover,


                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Material(
                elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),

                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(color: Colors.white,  borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      SizedBox(
                        height: 20.0,),
                    Text(
                      "Login",
                      style: Appwidget.HeadlineTextFeildStyle(),),
                      TextFormField(
                        controller: useremailcontroller,
                        validator: (value){
                          if(value==null|| value.isEmpty){
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: Appwidget.semiBooldTextFeildStyle(),
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller:userpasswordcontroller,
                        validator: (value){
                          if(value==null|| value.isEmpty){
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: Appwidget.semiBooldTextFeildStyle(),
                            prefixIcon: Icon(Icons.password_outlined)),
                      ),
                      SizedBox(
                        height: 20.0,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                        },
                        child: Container(
                            alignment: Alignment.topRight,
                            child: Text("Forgot password", style: Appwidget.semiBooldTextFeildStyle(),)),
                      ),
                      SizedBox(
                        height: 80.0,),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email= useremailcontroller.text;
                              password= userpasswordcontroller.text;
                            });
                          }
                          userLogin();
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0Xffff5722),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins1',
                                      fontWeight: FontWeight.bold),
                                ),
                              )

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: Appwidget.semiBooldTextFeildStyle(),
                        ),
                      )
                    
                    
                    
                                    ],),
                  ),
                ),
              )
            ],),
          )

        ],),
      ),
    );
  }
}
