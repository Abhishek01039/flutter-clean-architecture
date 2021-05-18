import 'package:flutter/material.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    this.suffixIcon,
    this.suffixIconPressed,
    this.isObsecure = false,
    required this.validate,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String labelText;
  final bool isObsecure;
  final FormFieldValidator<String>? validate;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final Icon? suffixIcon;
  final Function()? suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: suffixIconPressed,
              )
            : null,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.white60,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white60),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white60),
        ),
      ),
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      controller: textEditingController,
      validator: validate,
      obscureText: isObsecure,
    );
  }
}
