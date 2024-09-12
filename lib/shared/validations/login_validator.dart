import 'package:example_lucid_validation/app/models/login_model.dart';
import 'package:example_lucid_validation/app/models/register_model.dart';
import 'package:lucid_validation/lucid_validation.dart';

class LoginValidator extends LucidValidator<LoginModel> {
  LoginValidator() {

    ruleFor((login) => login.email, key: 'email')
        .notEmpty()
        .validEmail();
    
    ruleFor((login) => login.password, key: 'password')
        .notEmpty()
        .minLength(8, message: 'Password must be longer than 8 characters')
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter();
  }
}