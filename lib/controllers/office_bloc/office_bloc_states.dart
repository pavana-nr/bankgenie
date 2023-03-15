import 'package:bankgenie/models/office_model/office.dart';

class OfficeBlocState {}

class OfficeBlocInitialState extends OfficeBlocState {}

class OfficeBlocLoading extends OfficeBlocState {}

class OfficeBlocLoadedState extends OfficeBlocState {
  List<Office> data;
  OfficeBlocLoadedState(this.data);
}

class OfficeBlocError extends OfficeBlocState {
  Error? e;
  OfficeBlocError(this.e);
}

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Office> filteredItems;

  SearchLoaded(this.filteredItems);
}
