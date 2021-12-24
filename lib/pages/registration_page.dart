// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:e_khata/config/routes/routes.dart';
import 'package:e_khata/models/http.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Http http = Http();

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool obscurePasswordText = true;
  bool obscureConfirmText = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.fromFuture(http.makeUserGetRequest()),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            // backgroundColor: Color(0xffb74093),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 35),
                          ),
                          // Text(
                          //   "Register",
                          //   style: TextStyle(
                          //     fontSize: 30,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          Image.asset(
                            "assets/images/register.png",
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Create an Account",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "FullName",
                                        labelStyle: TextStyle(color: Colors.purple),
                                        enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.purple),),
                                         focusedBorder:UnderlineInputBorder(
                                         borderSide: const BorderSide(color: Colors. purple)),
                                        ),
                                        style: TextStyle(color: Colors.purple,fontSize: 18),
                                        cursorColor: Colors.purple,
                                        
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your first name.";
                                      }
                                      return null;
                                    }),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Username",
                                    labelStyle: TextStyle(color: Colors.purple),
                                    enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.purple),),
                                    focusedBorder:UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors. purple)),
                                  ),
                                  style: TextStyle(color: Colors.purple, fontSize: 18),
                                  cursorColor: Colors.purple,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Username is Empty";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      // prefixIcon: Icon(Icons.email),
                                      labelText: "Email",
                                      labelStyle: TextStyle(color: Colors.purple),
                                       enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.purple),),
                                    focusedBorder:UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors. purple)),
                                      ),
                                  style: TextStyle(color: Colors.purple,fontSize: 18),
                                  cursorColor: Colors.purple,
                                  
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Email is Empty");
                                    }
                                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                      return 'Please enter a valid Email';
                      }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: password,
                                  obscureText: obscurePasswordText,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: obscurePasswordText
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                            color: Colors.purple,
                                        onPressed: () {
                                          setState(() {
                                            obscurePasswordText =
                                                !obscurePasswordText;
                                          });
                                          
                                        }),
                                    labelText: "Password",
                                    
                                    labelStyle: TextStyle(color: Colors.purple),
                                    enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.purple),),
                                    focusedBorder:UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors. purple)),
                                  ),
                                  style: TextStyle(color: Colors.purple,fontSize: 18),
                                  cursorColor: Colors.purple,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is Empty";
                                    } else if (value.length < 6) {
                                      return "Password should be atleast 6 letters";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: confirmpassword,
                                  decoration: InputDecoration(                                    labelText: "Confirm Password",
                                      labelStyle: TextStyle(color: Colors.purple),
                                      enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purple),),
                                    focusedBorder:UnderlineInputBorder(
                                    borderSide: const BorderSide(color: Colors. purple)),
                                     ),
                                     style: TextStyle(color: Colors.purple,fontSize: 18),
                                  cursorColor: Colors.purple,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please re-enter password';
                                    }
                                    (password.text);
                                    (confirmpassword.text);
                                    if (password.text != confirmpassword.text) {
                                      return "Password does not match";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: InkWell(
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(
                                        context, MyRoutes.loginRoute);
                                  }
                                },
                                color: Colors.purple[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.loginRoute);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
