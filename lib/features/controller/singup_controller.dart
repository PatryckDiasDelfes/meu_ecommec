class SingUpController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckBox = false;
  bool isActiveButton = false;

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
