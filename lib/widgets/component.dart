import 'package:flutter/material.dart';

Widget dufaltFormField(
        {required TextInputType? keyboardType,
        bool obscureText = false,
        required String? Function(String?)? validat,
        Widget? label,
        void Function()? onTap,
        required String? hintText,
        required Widget? icon,
        TextEditingController? controller,
        Widget? prefixIcon}) =>
    TextFormField(
      onTap: onTap,
      obscureText: obscureText,
      controller: controller,
      validator: validat,
      decoration: InputDecoration(
        suffixIcon: prefixIcon,
        icon: icon,
        label: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
