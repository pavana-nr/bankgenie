import 'package:bankgenie/models/office_model/office.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/repository.dart';
import 'office_bloc_events.dart';
import 'office_bloc_states.dart';

class OfficeBlocBloc extends Bloc<OfficeBlocEvent, OfficeBlocState> {
  final Repository _repository = Repository();

  OfficeBlocState get initialState {
    return OfficeBlocInitialState();
  }

  OfficeBlocBloc() : super(OfficeBlocInitialState()) {
    on<OfficeBlocEvent>((event, emit) async {
      emit(OfficeBlocLoading());
      try {
        List<Office> officeBlocList = await _repository.getOffice();
        emit(OfficeBlocLoadedState(officeBlocList));
        debugPrint("{OfficeBlocList $officeBlocList}");
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(OfficeBlocError(Error()));
      }
    });
  }
}
