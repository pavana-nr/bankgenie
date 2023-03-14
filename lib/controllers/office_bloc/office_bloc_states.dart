class OfficeBlocState {}

class OfficeBlocInitialState extends OfficeBlocState {}

class OfficeBlocLoading extends OfficeBlocState {}

class OfficeBlocLoadedState extends OfficeBlocState {
  List<dynamic> data;
  OfficeBlocLoadedState(this.data);
}

class OfficeBlocError extends OfficeBlocState {
  Error? e;
  OfficeBlocError(this.e);
}
