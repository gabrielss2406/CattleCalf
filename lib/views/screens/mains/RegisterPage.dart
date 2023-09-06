// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:fetin/views/screens/mains/LoginPage.dart';
import 'package:fetin/views/screens/mains/StartPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordTwoController = TextEditingController();
  bool rememberPassword = false;

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void _registerWithEmailPassword() {
    String email = emailController.text;
    String name = nameController.text;
    String cpf = cpfController.text;
    String address = addressController.text;
    String password = passwordController.text;
    String passwordTwo = passwordTwoController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 120, 144, 72),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logologin.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 50),
              textField(nameController, "Nome"),
              textField(cpfController, "CPF"),
              textField(addressController, "Endereço"),
              textField(emailController, "Email"),
              textField(passwordController, "Senha"),
              textField(passwordTwoController, "Confirmar senha"),
              SizedBox(height: 10),
              InkWell(
                onTap: navigateToLogin,
                child: Text(
                  "JÁ TENHO CONTA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                width: 60,
                margin: EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 120, 144, 72),
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textField(controller, text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.transparent,
      ),
    ),
    margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
    padding: EdgeInsets.only(left: 10),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        labelStyle: TextStyle(
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 120, 144, 72),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0),
      ),
    ),
  );
}
