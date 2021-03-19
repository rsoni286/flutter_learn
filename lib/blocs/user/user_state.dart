import 'package:flutter_learn/models/user.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<User> users;

  const UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
