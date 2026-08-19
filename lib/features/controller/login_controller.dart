class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool isLoading = false;
  final int _caracterMinimoSenha = 6;
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void changeActiveButton() {
    isActiveButton =
        validateEmail(email) == null && validateSenha(senha) == null;
  }

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
    if (value.trim().length < _caracterMinimoSenha) {
      return 'Senha deve ter pelo menos $_caracterMinimoSenha caracteres';
    }
    return null;
  }
}
