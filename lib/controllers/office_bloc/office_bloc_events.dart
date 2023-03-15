class OfficeBlocEvent {
  const OfficeBlocEvent();
}

class FetchOfficeBlocEvent extends OfficeBlocEvent {
  FetchOfficeBlocEvent();
}

class SearchTextChangedEvent extends OfficeBlocEvent {
  final String query;

  SearchTextChangedEvent(this.query);
}
