
class LoginModel {
  String _email;
  String _password;

  LoginModel(
    this._email,
    this._password,
  );

  factory LoginModel.empty() {
    return LoginModel('', '');
  }

  void setEmail(String email) {
    _email = email;
  }
  void setPassword(String password) {
    _password = password;
  }

  String get email => _email;
  String get password => _password;
}