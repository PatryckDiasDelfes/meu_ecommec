class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final senhaRegx = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]).{8,}$',
  );

  bool isLoading = false;

  final int _caracterMinimoSenha = 6;
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  bool get isEmailValid => !_emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => senha.trim().length >= _caracterMinimoSenha;

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;
    return 'E-mail inválido';
  }

  String? get senhaError {
    if (senha.isEmpty || isSenhaValid) return null;
    return 'Senha inválida';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
