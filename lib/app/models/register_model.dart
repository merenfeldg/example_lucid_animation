class RegisterModel {
  String _name;
  String _email;
  String _phoneNumber;
  String _password;

  RegisterModel(
     this._name,
     this._email,
     this._phoneNumber,
     this._password,
  );

  factory RegisterModel.empty() {
    return RegisterModel('', '', '', '');
  }

  void setName(String name) {
    _name = name;
  }
  void setEmail(String email) {
    _email = email;
  }
  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
  void setPassword(String password) {
    _password = password;
  }

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
}