import 'package:lucid_validation/lucid_validation.dart';

import '../../app/models/register_model.dart';

class RegisterValidator extends LucidValidator<RegisterModel> {
  RegisterValidator() {
    ruleFor((register) => register.name, key: 'name')
        .notEmpty()
        .minLength(3, message: 'Name must be at least 3 characters long');

    ruleFor((register) => register.email, key: 'email')
        .notEmpty()
        .validEmail();

    ruleFor((register) => register.phoneNumber, key: 'phoneNumber')
        .notEmpty()
        .must((value) => value.length == 10, 'The number must have 10 characters', 'phone_length');

    ruleFor((register) => register.password, key: 'password')
        .notEmpty()
        .minLength(8, message: 'Password must be longer than 8 characters')
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter();
  }
}