import 'package:flutter_learn/ui/components/text.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() _onPressed;
  final IconData? _leftIcon, _rightIcon;
  final String? _text;
  final ButtonStyle _buttonStyle;
  final bool _fullWidth;

  Button.primary(BuildContext _context, this._onPressed,
      {IconData? leftIcon,
      IconData? rightIcon,
      String? text,
      bool fullWidth: false})
      : this._leftIcon = leftIcon,
        this._rightIcon = rightIcon,
        this._text = text,
        this._fullWidth = fullWidth,
        this._buttonStyle = _createPrimaryStyle(_context);

  Button.outline(BuildContext _context, this._onPressed,
      {IconData? leftIcon,
      IconData? rightIcon,
      String? text,
      bool fullWidth: false})
      : this._leftIcon = leftIcon,
        this._rightIcon = rightIcon,
        this._fullWidth = fullWidth,
        this._text = text,
        this._buttonStyle = _createOutLinedStyle(_context);

  static ButtonStyle _createPrimaryStyle(BuildContext _context) {
    final Color primaryColor = Theme.of(_context).primaryColor;
    return ElevatedButton.styleFrom(
        primary: primaryColor,
        onPrimary: Colors.white,
        onSurface: Colors.white70);
  }

  static ButtonStyle _createOutLinedStyle(BuildContext _context) {
    final Color primaryColor = Theme.of(_context).primaryColor;
    return ElevatedButton.styleFrom(
        side: BorderSide(color: primaryColor, width: 2),
        primary: Colors.white,
        onPrimary: primaryColor,
        onSurface: primaryColor);
  }

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Row(
          children: [
            if (_leftIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(_leftIcon),
              ),
            if (_text != null) TextView.medium(_text!),
            if (_rightIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(_rightIcon),
              ),
          ],
          mainAxisSize: _fullWidth ? MainAxisSize.max : MainAxisSize.min,
        ),
      ),
      style: _buttonStyle,
    );
  }
}
