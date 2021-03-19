import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/blocs/user/user_event.dart';
import 'package:flutter_learn/blocs/user/user_state.dart';
import 'package:flutter_learn/repos/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepo = UserRepo();

  UserBloc(UserInitial initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(event) async* {
    if (event is GetUsers) {
      yield UserLoading();
      try {
        yield UserLoaded(await _userRepo.getUsers());
      } catch (e) {
        yield UserError(e.toString());
      }
    }
  }
}
