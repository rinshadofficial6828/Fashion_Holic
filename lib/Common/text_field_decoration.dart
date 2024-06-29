import 'package:fashion_app/Common/thems.dart';
import 'package:flutter/material.dart';

InputDecoration textFormDecoration (suffixIcon,String hintText) {
 return InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                );
}
InputDecoration searchField(Widget prefixIcon, String hintText) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    hintText: hintText,
    contentPadding: EdgeInsets.all(12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Kcolors.btnColor, // Set the color you want when the field is focused
      ),
    ),
  );
}
