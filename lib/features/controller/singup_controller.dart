class SingUpController {
  final int _caracterMinimoSenha = 6;
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckBox = false;
  bool isActiveButton = false;
  bool isLoading = false;

  final SingUpValidator validator = SingUpValidator();

  void setEmail(String emailParam) {
    email = emailParam;
    checkCamp();
  }

  void setNome(String NomeParam) {
    nome = NomeParam;
    checkCamp();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    checkCamp();
  }

  void setConfirmarSenha(String ConfirmarSenhaParam) {
    confirmarSenha = ConfirmarSenhaParam;
    checkCamp();
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
    checkCamp();
  }

  void checkCamp() {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        isActiveCheckBox &&
        confirmarSenha.trim().isNotEmpty &&
        senha == confirmarSenha;
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
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

  String? validateConfirmarSenha(String? value) {
    if (value == null || value.trim().isEmpty) {}
    if (value != senha) {
      return 'As senhas não batem';
    }
    return null;
  }
}

class SingUpValidator {
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

  bool passwordMatch(String password, String confirmPassword) {
    return password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;
  }
}
