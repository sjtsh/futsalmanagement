import 'package:flutter/material.dart';
import 'package:letsfutsaladmin/Screens/NavigationScreen.dart';
import 'package:letsfutsaladmin/Services/Auth.dart';
import 'package:letsfutsaladmin/global.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  bool isValidation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo.png"),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          "Log in to your account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Expanded(child: Container()),
                      TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          errorText: emailcontroller.text == "" && isValidation
                              ? "enter the email"
                              : null,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          hintText: "Email*",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText:
                              passwordcontroller.text == "" && isValidation
                                  ? "enter the password"
                                  : null,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          hintText: "Password*",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          print("hello world");
                          setState(() {
                            isValidation = true;
                          });
                          if (emailcontroller.text != "" &&
                              passwordcontroller.text != "") {
                            Auth()
                                .signIn(emailcontroller.text,
                                    passwordcontroller.text)
                                .then((value) {
                              print("Success $value");
                              username = value;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return NavigationScreen();
                              }));
                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error.toString()),
                                ),
                              );
                            });
                          }
                        },
                        child: Container(
                          height: 80,
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/signin.png"),
                        fit: BoxFit.cover)),
              ))
        ],
      ),
    );
  }
}
