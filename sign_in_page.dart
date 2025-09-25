import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.title});


  final String title;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
    bool done = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 47, 139, 185)),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 47, 139, 185), Color.fromARGB(255, 209, 142, 142)],
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            height: height * 0.4,
            width: width * 0.9,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
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
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your email",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 75, 88, 95),
                          ),
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
                  /////////////////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "Password",
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your password",
                          style: TextStyle(
                            fontFamily: "Suwannaphum-Bold",
                            color: const Color.fromARGB(255, 75, 88, 95),
                          ),
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
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          done = true;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  ////////////////////////////////////////////////////////////
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
                            content: Text("Sign In Successfully"),
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
                      "Sign In",
                      style: TextStyle(
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