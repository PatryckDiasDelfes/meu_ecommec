class SingUpController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckBox = false;
  bool isActiveButton = false;

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
