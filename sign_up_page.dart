import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});


  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   bool done = false;
  bool visible = false;
  String? confirm_password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 47, 139, 185)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 47, 139, 185), Color.fromARGB(255, 209, 142, 142)],
          ),
        ),
        height: height,
        width: width,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            height: height * 0.7,
            width: width * 0.9,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Join Now",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 86, 84, 90),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "Full Name",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your full name",
                          style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Re Enter Your Name ";
                        }
                        return null;
                      },
                    ),
                  ),
                  /////////////////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(right: 280),
                    child: Text(
                      "Email",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your email",
                          style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Re Enter Your Name ";
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return "Incorrect email";
                        }
                        return null;
                      },
                    ),
                  ),
                  ////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "Password",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your password",
                          style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        confirm_password = value;
                        if (value == null || value.isEmpty) {
                          return "Please Re Enter Your Name ";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  ///////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(right: 186),
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            visible = !visible;
                            setState(() {});
                          },
                          icon: (visible == true)
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        hint: Text(
                          "Confirm your password",
                          style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Re Enter Your Name";
                        } else if (confirm_password != value) {
                          return "Passwords do not match";
                        } else {
                          done = true;
                        }
                        return null;
                      },
                      obscureText: !visible,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        debugPrint("re");
                      }
                      if (done) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Account created successfully"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryanimation,
                                            ) => HomePage(title: '',),
                                        transitionDuration: Duration(
                                          milliseconds: 500,
                                        ),
                                        transitionsBuilder:
                                            (
                                              context,
                                              animation,
                                              secondaryanimation,
                                              child,
                                            ) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 148, 86, 255),
                      minimumSize: Size(300, 45),
                    ),

                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}