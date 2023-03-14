class LoginBlocEvent {
  final String username;
  final String password;

  const LoginBlocEvent({required this.username, required this.password});
  // const LoginBlocEvent();
}

class FetchLoginBlocEvent extends LoginBlocEvent {
  FetchLoginBlocEvent({required super.username, required super.password});
}
