import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';

class CustomTextField extends StatefulWidget {
  static const String routeName = "CustomTextField";
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassword = true;
  String? errorText ;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.hintText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          onChanged: (value) {
            if(widget.validator != null){
              setState(() {
                errorText = widget.validator!(value);
              });
            }
          },
          forceErrorText: errorText,
          cursorColor: AppColor.red,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            // errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.black),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black),
              borderRadius: BorderRadius.circular(16),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.red),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusColor: AppColor.black,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.black),
              borderRadius: BorderRadius.circular(16),
            ),
            prefixIcon: Icon(widget.prefixIcon, color: AppColor.black),
            suffixIcon:
                (widget.hintText == 'Password' || widget.hintText == 'Re-type Password')
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColor.black,
                    ),
                  )
                : null,
          ),
          obscureText: (widget.hintText == "Password" || widget.hintText == "Re-type Password") ? isPassword : false,
          enableSuggestions: false,
          autocorrect: false,
        ),
      ],
    );
  }
}
