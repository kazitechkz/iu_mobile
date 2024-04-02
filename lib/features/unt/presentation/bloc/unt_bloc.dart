import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/unt/domain/use_cases/get_subjects_case.dart';

import '../../../../core/common/models/failure_data.dart';
import '../../../../core/common/models/subject.dart';

part 'unt_event.dart';
part 'unt_state.dart';

class UntBloc extends Bloc<UntEvent, UntState> {
  UntBloc({required GetSubjectsCase getSubjectsCase})
      : _getSubjectsCase = getSubjectsCase,
        super(UntInitialState())
  {
      on<UntGetSubjectsEvent>(_handleGetSubjectEvent);
  }

  final GetSubjectsCase _getSubjectsCase;

  Future<void> _handleGetSubjectEvent(UntGetSubjectsEvent event, Emitter<UntState> emit)async{
    emit(UntLoadingState());
    final result = await _getSubjectsCase();
    result.fold(
            (l) => emit(UntFailedState(FailureData(statusCode: l.statusCode,message: l.message,errors: l.errors))),
            (r) => emit(UntSubjectLoadedState(r))
    );
  }
}
