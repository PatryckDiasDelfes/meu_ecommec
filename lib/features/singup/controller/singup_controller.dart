// Sempre que uma informação seja bool, string, int ou qualquer coisa mudar apos essa mudança uso o notifyListeners()?
// A logica é essa, ou pode ser mais abrangente que isso?

import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  // ============================================================
  // CONFIGURAÇÕES
  // ============================================================

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // ============================================================
  // ESTADO DA TELA
  // ============================================================

  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool checkBoxError = false;

  bool isActiveCheckBox = false;
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ============================================================
  // VALIDADOR
  // ============================================================

  final SingUpValidator validator = SingUpValidator();

  // ============================================================
  // ALTERAÇÃO DOS DADOS
  // ============================================================

  void setSenha(String senhaParam) {
    senha = senhaParam;
    notifyListeners();
  }

  void setConfirmarSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    notifyListeners();
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;

    if (isActiveCheckBox) {
      checkBoxError = false;
    }
    notifyListeners();
  }

  // ============================================================
  // VALIDAÇÕES DE ERRO VISUAL
  // ============================================================

  // ============================================================
  // SIGNUP
  // ============================================================

  Future<void> signUp() async {
    await Future.delayed(const Duration(seconds: 2));
    
  }

  // ============================================================
  // VALIDADORES DOS CAMPOS
  // ============================================================

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Digite seu e-mail';
    }

    if (!_emailRegex.hasMatch(value.trim())) {
      return 'E-mail inválido';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Digite seu nome';
    }

    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Digite sua senha';
    }

    if (!validator.isValidPassword(value)) {
      return 'Senha deve atender aos requisitos mínimos';
    }

    return null;
  }

  String? validateConfirmarSenha(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirme sua senha';
    }

    if (value != senha) {
      return 'As senhas não batem';
    }

    return null;
  }

  Future<void> handleSingUp() async {
    if (formKey.currentState!.validate()) {
      if (!isActiveCheckBox) {
        checkBoxError = true;
        notifyListeners();
        return;
      }

      isLoading = true;
      notifyListeners();

      await signUp();

      isLoading = false;
      notifyListeners();
    }
  }
}

// ================================================================
// VALIDADOR DE SENHA
// ================================================================

class SingUpValidator {
  bool isValidPassword(String password) {
    return minChars(password) &&
        specialChar(password) &&
        upperCase(password) &&
        lowerCase(password) &&
        number(password) &&
        noSpace(password);
  }

  bool minChars(String password) {
    return password.length >= 6;
  }

  bool specialChar(String password) {
    return minChars(password) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool upperCase(String password) {
    return minChars(password) && password.contains(RegExp(r'[A-Z]'));
  }

  bool lowerCase(String password) {
    return minChars(password) && password.contains(RegExp(r'[a-z]'));
  }

  bool number(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool noSpace(String password) {
    return !password.contains(' ');
  }

  bool passwordMatch(String password, String confirmPassword) {
    return password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }
}

class Usuario {
  final String nome;
  final String email;

  Usuario({required this.nome, required this.email});
}
