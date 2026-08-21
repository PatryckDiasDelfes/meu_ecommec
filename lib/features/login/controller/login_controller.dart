import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  // ============================================================
  // CONFIGURAÇÕES
  // ============================================================

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final int _minimumPasswordCharacters = 6;

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

  Future<void> handleLogin() async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      await login();

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
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
