import 'package:example_lucid_validation/shared/validations/register_validator.dart';
import 'package:flutter/material.dart';

import '../../models/register_model.dart';
import '../widgets/button_forgot_password.dart';
import '../widgets/button_form.dart';
import '../widgets/text_input_custom.dart';
import '../widgets/title_form.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.sizeOf(context);

    final validator = RegisterValidator();
    final formRegisterModel = RegisterModel.empty();

    void _goToLoginPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginPage()
        )
      );
    }

    return Material(
      color: const Color(0xFFF5F5F5),
      child: Stack(
        children: [
          Container(
            height: size.height * .5,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Color(0xFF138acc),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)
                )
            ),
            child:  const Padding(
              padding: EdgeInsets.only(top: 88),
              child: TitleForm(title: 'REGISTER'),
            ),
          ),
          Positioned(
            top: 260,
            left: 16,
            right: 16,
            child: Container(
              height: size.height * .582,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        offset: const Offset(4, 2),
                        blurRadius: 5.0
                    )
                  ]
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 30
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 64),
                      TextInputCustom(
                        hint: 'Name',
                        width: 340,
                        icon: Icons.person_2_outlined,
                        validator: validator.byField(formRegisterModel, 'name'),
                        onChanged: formRegisterModel.setName,
                      ),
                      const SizedBox(height: 24),
                      TextInputCustom(
                        hint: 'Email',
                        width: 340,
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: validator.byField(formRegisterModel, 'email'),
                        onChanged: formRegisterModel.setEmail,
                      ),
                      const SizedBox(height: 24),
                      TextInputCustom(
                        hint: 'Phone Number',
                        width: 340,
                        icon: Icons.smartphone,
                        keyboardType: TextInputType.phone,
                        validator: validator.byField(formRegisterModel, 'phoneNumber'),
                        onChanged: formRegisterModel.setPhoneNumber,
                      ),
                      const SizedBox(height: 24),
                      TextInputCustom(
                        hint: 'Password',
                        width: 340,
                        icon: Icons.vpn_key_outlined,
                        validator: validator.byField(formRegisterModel, 'password'),
                        onChanged: formRegisterModel.setPassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 60),
                      ButtonForm(name: 'Sign in', onTap: (){}),
                      const SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: _goToLoginPage,
                          child: RichText(
                              text: const TextSpan(
                                  text: 'Already A Member? ',
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Sign In',
                                        style: TextStyle(
                                            color: Colors.blue
                                        )
                                    )
                                  ]
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
