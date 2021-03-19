import 'dart:ui';

import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String _text;
  final double _textSize;
  final FontWeight _fontWeight;
  final Color? _color;

  TextView.tiny(this._text, {fontWeight: FontWeight.normal, color})
      : this._textSize = 12,
        this._color = color,
        this._fontWeight = fontWeight;

  TextView.small(this._text, {fontWeight: FontWeight.normal, color})
      : this._textSize = 14,
        this._color = color,
        this._fontWeight = fontWeight;

  TextView.medium(this._text, {fontWeight: FontWeight.normal, color})
      : this._textSize = 16,
        this._color = color,
        this._fontWeight = fontWeight;

  TextView.large(this._text, {fontWeight: FontWeight.normal, color})
      : this._textSize = 18,
        this._color = color,
        this._fontWeight = fontWeight;

  TextView.huge(this._text, {fontWeight: FontWeight.normal, color})
      : this._textSize = 20,
        this._color = color,
        this._fontWeight = fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _color != null
          ? TextStyle(
              fontSize: _textSize, fontWeight: _fontWeight, color: _color)
          : TextStyle(fontSize: _textSize, fontWeight: _fontWeight),
      textAlign: TextAlign.start,
    );
  }
}
