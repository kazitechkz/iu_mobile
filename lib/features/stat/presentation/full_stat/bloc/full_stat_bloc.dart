import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/use_cases/all_attempt_types_case.dart';
import 'package:iu/features/stat/domain/parameters/full_stat_parameter.dart';
import 'package:iu/features/stat/domain/use_cases/full_stat_case.dart';
import 'package:iu/features/subject/domain/use_cases/subject_usecase.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/subject.dart';
import '../../../../attempt/domain/entities/attempt_type_entity.dart';
import '../../../domain/entities/full_stat_entity.dart';
part 'full_stat_event.dart';
part 'full_stat_state.dart';

class FullStatBloc extends Bloc<FullStatEvent, FullStatState> {
  FullStatBloc(
      {required FullStatCase fullStatCase,
      required SubjectUseCase subjectUseCase,
      required AllAttemptTypesCase allAttemptTypesCase})
      : _fullStatCase = fullStatCase,
        _subjectUseCase = subjectUseCase,
        _allAttemptTypesCase = allAttemptTypesCase,
        super(FullStatInitialState()) {
    on<FullStatGetStatsEvent>(_handleFullStatGetStatsEvent);
    on<FullStatGetSubjectsEvent>(_handleFullStatGetSubjectsEvent);
    on<FullStatGetAttemptTypesEvent>(_handleFullStatGetAttemptTypesEvent);
  }

  final FullStatCase _fullStatCase;
  final SubjectUseCase _subjectUseCase;
  final AllAttemptTypesCase _allAttemptTypesCase;

  Future<void> _handleFullStatGetStatsEvent(
      FullStatGetStatsEvent event, Emitter<FullStatState> emit) async {
    emit(FullStatLoadingState());
    final result = await _fullStatCase(event.parameter);
    result.fold((l) => emit(FullStatFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(FullStatSuccessState(stat: r)));
  }

  Future<void> _handleFullStatGetSubjectsEvent(
      FullStatGetSubjectsEvent event, Emitter<FullStatState> emit) async {
    if (state is FullStatSuccessState) {
      final currentState = state as FullStatSuccessState;
      final result = await _subjectUseCase();
      result.fold(
          (l) => emit(FullStatFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(subjectsEntity: r)));
    }
  }

  Future<void> _handleFullStatGetAttemptTypesEvent(
      FullStatGetAttemptTypesEvent event, Emitter<FullStatState> emit) async {
    if (state is FullStatSuccessState) {
      final currentState = state as FullStatSuccessState;
      final result = await _allAttemptTypesCase();
      result.fold(
          (l) => emit(FullStatFailedState(FailureData.fromApiFailure(l))),
          (r) => emit(currentState.copyWith(attemptType: r)));
    }
  }
}
