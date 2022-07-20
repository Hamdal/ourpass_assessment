import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ourpass_assessment/config/constants.dart';

class CustomTextInput extends StatelessWidget {
  final String? label;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final bool? hideText;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final Function()? onTapSuffix;
  final Function(String)? onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  
  const CustomTextInput({ 
    Key? key, 
    this.label, 
    this.focusNode,
    this.inputType,
    this.hideText = false,
    this.suffix,
    this.controller,
    this.prefix,
    this.onTapSuffix,
    this.onChanged,
    this.hintText,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: hideText!,
      keyboardType: inputType,
      style: const TextStyle(
        color: Colors.black87
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(8)
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: hintText,
        prefix: prefix,
        suffix: InkWell(
          onTap: onTapSuffix, 
          child: suffix ?? const SizedBox(),
        ),
      ),
    );
  }
}