import 'package:example_lucid_validation/app/models/register_model.dart';
import 'package:flutter/material.dart';

import '../../../shared/validations/login_validator.dart';

class TextInputCustom extends StatefulWidget {

  TextInputCustom({
    super.key,
    required this.width,
    required this.icon,
    required this.hint,
    required this.validator,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isPassword = false
  });

  final String hint;
  final double width;
  final IconData icon;
  bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;

  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {

  var isMarcked = true;

  void changeState(){
    setState(() {
      isMarcked = !isMarcked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && isMarcked,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: const Color(0xFFf2f2f2),
          filled: true,
          hintText: widget.hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 24
            ),
            child: Icon(
              widget.icon,
              color: const Color(0xFF989898),
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF989898),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          suffixIcon: widget.isPassword
              ? isMarcked == true
                  ? IconButttonCustom(
                      onTap: changeState,
                      icon: Icons.visibility_outlined,
                    )
                  : IconButttonCustom(
                      onTap: changeState,
                      icon: Icons.visibility_off_outlined,
                    )
              : null
        ),
      ),
    );
  }
}

class IconButttonCustom extends StatelessWidget {

  const IconButttonCustom({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24
      ),
      child: GestureDetector(
          onTap: onTap,
          child: Icon(
            icon,
            color: const Color(0xFF989898),
          )
      ),
    );
  }
}
