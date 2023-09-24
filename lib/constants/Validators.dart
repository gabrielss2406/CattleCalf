import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Validators {
  String? validatePassword(value) {
    RegExp regex = RegExp(r"(^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$)");
    if (value!.isEmpty) {
      return "Campo vazio";
    } else if (!regex.hasMatch(value)) {
      return "Tem que ter ao menos 1 maiscula, 1 numero e 7 letras.";
    }
    return null;
  }

  String? validateTelefone(value) {
    if (value!.isEmpty) {
      return "Campo vazio";
    } else if (value.toString().length < 15) {
      return "Telefone Inválido, ex: (99) 99999-9999";
    }
    return null;
  }

  String? validateCPF(value) {
    if (value!.isEmpty) {
      return "Campo vazio";
    } else if (CPFValidator.isValid(value) == false) {
      return "CPF Inválido";
    }
    return null;
  }

  String? validateEmail(value) {
    RegExp regex = RegExp(r"(^.+@.+$)");
    if (value!.isEmpty) {
      return "Campo vazio";
    } else if (!regex.hasMatch(value)) {
      return "Email inválido, ex: (nome@email.com)";
    }
    return null;
  }

  String? validateCommon(value) {
    if (value!.isEmpty) {
      return "Campo Vazio";
    }
    return null;
  }
}
