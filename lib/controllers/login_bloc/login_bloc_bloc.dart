import 'package:bankgenie/utils/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/login_model/login_model.dart';
import '../../services/repository.dart';
import 'login_bloc_events.dart';
import 'login_bloc_states.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final Repository _loginBlocRepository = Repository();

  LoginBlocState get initialState {
    return LoginBlocInitialState();
  }

  LoginBlocBloc() : super(LoginBlocInitialState()) {
    on<LoginBlocEvent>((event, emit) async {
      emit(LoginBlocLoading());
      try {
        LoginModel loginBlocList =
            await _loginBlocRepository.login(event.username, event.password);
        Preferences.setLoggedInStatus();
        emit(LoginBlocLoadedState(loginBlocList));
        debugPrint("{loginBlocList $loginBlocList}");
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(LoginBlocError(Error()));
      }
    });
  }
}
