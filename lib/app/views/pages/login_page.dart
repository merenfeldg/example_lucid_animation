import 'package:example_lucid_validation/app/models/login_model.dart';
import 'package:example_lucid_validation/app/views/pages/register_page.dart';
import 'package:example_lucid_validation/app/views/widgets/button_form.dart';
import 'package:example_lucid_validation/app/views/widgets/title_form.dart';
import 'package:flutter/material.dart';

import '../../../shared/validations/login_validator.dart';
import '../widgets/button_forgot_password.dart';
import '../widgets/text_input_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    final size = MediaQuery.sizeOf(context);

    final validator = LoginValidator();
    final formLoginModel = LoginModel.empty();

    void _goToRegisterPage() {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const RegisterPage()
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
              color: Color(0xFF138ACC),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40)
              )
            ),
            child:  const Padding(
              padding: EdgeInsets.only(top: 88),
              child: TitleForm(title: 'WELCOME!!'),
            ),
          ),
          Positioned(
            top: 330,
            left: 16,
            right: 16,
            child: Container(
            height: size.height * .5,
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
                      hint: 'Email',
                      width: 340,
                      icon: Icons.email_outlined,
                      validator: validator.byField(formLoginModel, 'email'),
                      onChanged: formLoginModel.setEmail,
                    ),
                    const SizedBox(height: 24),
                    TextInputCustom(
                      hint: 'Password',
                      width: 340,
                      icon: Icons.vpn_key_outlined,
                      validator: validator.byField(formLoginModel, 'password'),
                      onChanged: formLoginModel.setPassword,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: ButtonForgotPassword(onTap: () {},),
                    ),
                    const SizedBox(height: 90),
                    ButtonForm(
                      name: 'Login',
                      onTap: () {
                        setState(() {});
                      }
                      ,),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: _goToRegisterPage,
                        child: RichText(
                            text: const TextSpan(
                                text: 'Don\'t have a account? ',
                                style: TextStyle(
                                    color: Colors.black
                                ),
                                children: [
                                  TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                          color: Colors.blue
                                      )
                                  )
                                ]
                            )
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
