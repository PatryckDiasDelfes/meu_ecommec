class LoginController {
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

  void changeActiveButton() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
  }

  void changeActiveCheckBox() {
    isActiveCheckBox = !isActiveCheckBox;
  }
}
