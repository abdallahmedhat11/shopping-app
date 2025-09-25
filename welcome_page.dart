import 'package:flutter/material.dart';
import 'package:shopping_app/sign_in_page.dart';
import 'package:shopping_app/sign_up_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.title});


  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello, Sir...",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 47, 139, 185),
      ),
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              child: Center(
                child: Text(
                  "Welcome To ShopCraft",
                  style: TextStyle(
                    fontSize: 26,
                    color: const Color.fromARGB(255, 252, 252, 252),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              height: height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      width: width * 0.45,
                      height: height * 0.45,
                      "https://img.freepik.com/premium-photo/shopping-cart-with-bags-it-that-say-shopping_967785-77696.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) =>
                            SignUpPage(title: '',),
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) =>
                            SignInPage(title: '',),
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Text(
                    "Sign in",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}