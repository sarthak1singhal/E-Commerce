import 'package:flutter/material.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea(
      {String labelValue = "",
      String hintValue = "",
      TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      TextStyle textStyle,
        bool enabled = true,
      Function validation,
      String validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(
          color: Colors.black87
      ),
      controller: controller,
      validator: validation,
      enabled: enabled,
      decoration: InputDecoration(
          labelText: labelValue,
          hintText: hintValue,
          contentPadding: EdgeInsets.only(left: 7, right: 7),
          labelStyle: TextStyle(
            color: Colors.black54,
          ),

      ),
    );
    return textFormField;
  }
}
