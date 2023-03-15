import '../../models/login_model/login_model.dart';

class LoginBlocState {}

class LoginBlocInitialState extends LoginBlocState {}

class LoginBlocLoading extends LoginBlocState {}

class LoginBlocLoadedState extends LoginBlocState {
  LoginModel? data;
  LoginBlocLoadedState(this.data);
}

class LoginBlocError extends LoginBlocState {
  Error? e;
  LoginBlocError(this.e);
}
