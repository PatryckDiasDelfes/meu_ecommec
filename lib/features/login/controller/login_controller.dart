import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/features/login/model/user.dart';
import 'package:meu_1_ecommerc/shared/exeptions/auth_exeption.dart';

class LoginController extends ChangeNotifier {
  User? user;
  // ============================================================
  // CONFIGURAÇÕES
  // ============================================================

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final int _minimumPasswordCharacters = 6;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  // ============================================================
  // ESTADO DA TELA
  // ============================================================

  String email = '';
  String senha = '';

  bool isLoading = false;
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  // ============================================================
  // ALTERAÇÃO DOS DADOS
  // ============================================================

  void setEmail(String emailParam) {
    email = emailParam;
    _updateButtonState();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    _updateButtonState();
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
    notifyListeners();
  }

  // ============================================================
  // LOGIN
  // ============================================================

  void changesIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('Validaçao_incorreta');
    }
    changesIsLoading(true);

    try {
      await login();

      emailController.clear();
      senhaController.clear();
    } finally {
      changesIsLoading(false);
    }
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    if (emailController.text.trim() != 'delfesne@gmail.com' ||
        senhaController.text.trim() != '1234567') {
      throw AuthException('E-mail ou senha incorretos');
    }
    user = User(nome: 'Patryck', email: emailController.text);
  }

  // ============================================================
  // CONTROLE DO BOTÃO
  // ============================================================

  void _updateButtonState() {
    isActiveButton =
        validateEmail(email) == null && validateSenha(senha) == null;

    notifyListeners();
  }

  // ============================================================
  // VALIDAÇÕES
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

  String? validateSenha(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Digite sua senha';
    }

    if (value.trim().length < _minimumPasswordCharacters) {
      return 'Senha deve ter pelo menos $_minimumPasswordCharacters caracteres';
    }

    return null;
  }
}
