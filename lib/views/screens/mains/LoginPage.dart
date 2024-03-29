// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'package:cattecalf/database/services/AuthServices.dart';
import 'package:cattecalf/views/screens/mains/RegisterPage.dart';
import 'package:cattecalf/views/screens/mains/StartPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberPassword = false;
  bool _obscurePassword = true;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthServices.verifyLogged().then(
        (value) {
          if (value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => StartPage(),
              ),
            );
          }
        },
      );
    });
  }

  void navigateToRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  void _loginWithEmailPassword() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      bool result = await AuthServices.doLogin(email, password);
      if(!result) throw Error;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StartPage(),
          ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Verifique sua conexão a internet, seu email e senha.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _loginWithFacebook(context) async {
    await AuthServices.doLogin("02126632679", "senha123");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartPage(),
        ));
  }

  void _loginWithGoogle() {}

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
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 100,
              ),
              textField(emailController, "Email"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: Icon(
                          _obscurePassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.brown[800]),
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    labelText: "Senha",
                    focusedBorder: OutlineInputBorder(
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberPassword,
                      onChanged: (value) {
                        setState(() {
                          rememberPassword = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      activeColor: Colors.brown[800],
                      checkColor: Colors.white,
                    ),
                    Text(
                      "Lembrar senha",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 25),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 60,
                      margin: EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/googleIcon.png',
                                height: 25,
                                width: 25,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15)),
                      height: 60,
                      margin: EdgeInsets.only(top: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StartPage(),
                              ));
                        },
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 60,
                      margin: EdgeInsets.only(top: 10),
                      child: IconButton(
                        onPressed: () {
                          _loginWithEmailPassword();
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 120, 144, 72),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: navigateToRegister,
                child: Text(
                  "NÃO POSSUO CADASTRO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    decoration: TextDecoration.underline,
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
