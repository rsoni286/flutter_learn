import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double _radius, _width, _height;
  final String? _url;
  final String? _asset;
  final File? _file;

  RoundedImage.url(this._url, this._width, this._height, this._radius)
      : this._asset = null,
        this._file = null;

  RoundedImage.asset(this._asset, this._width, this._height, this._radius)
      : this._url = null,
        this._file = null;

  RoundedImage.file(this._file, this._width, this._height, this._radius)
      : this._asset = null,
        this._url = null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(_radius), child: _buildImage());
  }

  Widget _buildImage() {
    if (_url != null) {
      return Image.network(
        _url!,
        height: _height,
        width: _width,
      );
    } else if (_asset != null) {
      return Image.asset(
        _asset!,
        height: _height,
        width: _width,
      );
    } else if (_file != null) {
      return Image.file(
        _file!,
        height: _height,
        width: _width,
      );
    }

    return Container(
      height: _height,
      width: _width,
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
    );
  }
}
