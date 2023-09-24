// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:fetin/constants/Validators.dart';
import 'package:fetin/database/services/AuthServices.dart';
import 'package:fetin/views/screens/mains/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

TextEditingController passwordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  /// Masks for Cpf and Telefone
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskTelefone = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskPassword = LengthLimitingTextInputFormatter(25);
  final commonMask = LengthLimitingTextInputFormatter(80);

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordTwoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  bool rememberPassword = false;
  final _formKey = GlobalKey<FormState>();

  void navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void _registerWithEmailPassword() async {
    String email = emailController.text;
    String name = nameController.text;
    String cpf = cpfController.text;
    String address = addressController.text;
    String telefone = telefoneController.text;
    String password = passwordController.text;
    String passwordTwo = passwordTwoController.text;

    if (_formKey.currentState!.validate()) {
      try {
        await AuthServices.register(
            email, name, cpf, address, telefone, password, passwordTwo);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Verifique sua conexão a internet.'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 120, 144, 72),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/logologin.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 50),
                  textField(nameController, "Nome", Validators().validateCommon,
                      commonMask),
                  textField(
                      cpfController, "CPF", Validators().validateCPF, maskCpf),
                  textField(addressController, "Endereço",
                      Validators().validateCommon, commonMask),
                  textField(emailController, "Email",
                      Validators().validateEmail, commonMask),
                  textField(telefoneController, "Telefone",
                      Validators().validateTelefone, maskTelefone),
                  textField(passwordController, "Senha",
                      Validators().validatePassword, maskPassword),
                  textField(passwordTwoController, "Confirmar senha", false,
                      maskPassword),
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
                        _registerWithEmailPassword();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 120, 144, 72),
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget textField(controller, text, validate, inputFormatters) {
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
    child: TextFormField(
      inputFormatters: [inputFormatters],
      controller: controller,
      validator: validate == false
          ? (value) {
              if (value!.isEmpty) {
                return "Campo vazio";
              } else if (value != passwordController.text) {
                return "Senhas diferentes!";
              }
              return null;
            }
          : validate,
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
