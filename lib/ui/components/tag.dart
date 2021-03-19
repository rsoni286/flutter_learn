import 'package:flutter/material.dart';
import 'package:flutter_learn/ui/components/text.dart';

class Tag extends StatefulWidget {
  final Function()? _onTap;
  final Icon? _icon;
  final String? _text;
  final Color _textColor;
  final Color? _bgColor;
  final bool _fullWidth;

  Tag(
      {Function()? onTap,
      Icon? icon,
      String? text,
      bool fullWidth = false,
      Color textColor = Colors.white,
      Color? bgColor})
      : this._onTap = onTap,
        this._fullWidth = fullWidth,
        this._text = text,
        this._textColor = textColor,
        this._bgColor = bgColor,
        this._icon = icon;

  @override
  State<StatefulWidget> createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _tapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _tapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _tapped = false;
        });
      },
      onTap: widget._onTap,
      child: Container(
        decoration: BoxDecoration(
            color: _getTagColor(), borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
          child: Row(
            mainAxisSize:
                widget._fullWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (widget._icon != null) widget._icon!,
              SizedBox(width: 5),
              if (widget._text != null)
                TextView.small(widget._text!, color: widget._textColor),
            ],
          ),
        ),
      ),
    );
  }

  _getTagColor() {
    Color color = widget._bgColor == null
        ? Theme.of(context).primaryColor
        : widget._bgColor!;

    if (widget._onTap != null && _tapped) {
      color = Color.fromRGBO(
          (color.red * 0.5).toInt(),
          (color.green * 0.5).toInt(),
          (color.blue * 0.5).toInt(),
          color.opacity);
    }
    return color;
  }
}
