import 'package:flutter/material.dart';
import 'package:letsfutsal/Services/Auth.dart';

import '../MyHomePage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isValidated = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: ListView(children: [
          Text(
            "Sign Up,\nBecome member of Let's Futsal Community",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff435244)),
            textAlign: TextAlign.center,
          ),
          Divider(
            color: Colors.yellow,
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Your Name",
                errorText: nameController.text == "" && isValidated
                    ? "Name cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                errorText: emailController.text == "" && isValidated
                    ? "Email cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone No.",
                errorText: phoneController.text == "" && isValidated
                    ? "Phone cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: "Current Address",
                errorText: addressController.text == "" && isValidated
                    ? "Address cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New Password",
                errorText: passwordController.text == "" && isValidated
                    ? "Password cannot be empty"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                errorText: passwordController.text != confirmController.text
                    ? "Passwords do not match"
                    : null,
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  isValidated = true;
                });
                if (nameController.text != "" &&
                    emailController.text != "" &&
                    phoneController.text != "" &&
                    addressController.text != "" &&
                    passwordController.text != "" &&
                    passwordController.text == confirmController.text) {
                  Auth()
                      .signUp(
                          nameController.text,
                          passwordController.text,
                          emailController.text,
                          phoneController.text,
                          addressController.text)
                      .then((value) {
                    print(value);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return MyHomePage();
                    }));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())));
                  });
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
