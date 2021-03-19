import 'package:flutter/foundation.dart';

@immutable
abstract class UserEvent {}

class GetUsers extends UserEvent {}
