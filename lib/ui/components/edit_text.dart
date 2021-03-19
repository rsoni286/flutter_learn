import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String? _label;
  final String? _hint;
  final TextInputType? _inputType;
  final Icon? _icon;
  final bool _isPassword;

  EditText(
      {String? label,
      String? hint,
      TextInputType? inputType,
      Icon? icon,
      bool isPassword = false})
      : this._label = label,
        this._hint = hint,
        this._inputType = inputType,
        this._icon = icon,
        this._isPassword = isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: _inputType == null ? TextInputType.text : _inputType,
      decoration: InputDecoration(
        prefixIcon: _icon,
        border: OutlineInputBorder(),
        labelText: _label,
        hintText: _hint,
        contentPadding: EdgeInsets.all(8)
      ),
      obscureText: _isPassword,
      style: TextStyle(fontSize: 18),
    );
  }
}
