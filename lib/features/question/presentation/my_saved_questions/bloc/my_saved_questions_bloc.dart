import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import '../../../../attempt/domain/entities/question_entity.dart';
import '../../../domain/parameters/get_my_saved_questions_parameter.dart';
import '../../../domain/use_cases/get_my_saved_questions_case.dart';

part 'my_saved_questions_event.dart';

part 'my_saved_questions_state.dart';

class MySavedQuestionsBloc
    extends Bloc<MySavedQuestionsEvent, MySavedQuestionsState> {
  final GetMySavedQuestionsCase _getMySavedQuestionsCase;
  int _currentPage = 1;
  bool _isLastPage = false;

  MySavedQuestionsBloc({required GetMySavedQuestionsCase useCase})
      : _getMySavedQuestionsCase = useCase,
        super(MySavedQuestionsInitial()) {
    on<GetMySavedQuestionsEvent>(_handleGetMySavedQuestions);
    on<ResetMySavedQuestionsEvent>(_handleResetMySavedQuestions);
  }

  Future<void> _handleGetMySavedQuestions(GetMySavedQuestionsEvent event,
      Emitter<MySavedQuestionsState> emit) async {
    if (_isLastPage) return;
    final currentState = state;
    final result = await _getMySavedQuestionsCase(
        event.params.copyWith(page: _currentPage));
    result.fold(
      (l) => emit(MySavedQuestionsError(FailureData.fromApiFailure(l))),
      (paginationData) {
        final questions = paginationData.data;
        if (questions.isEmpty || _currentPage >= paginationData.lastPage) {
          _isLastPage = true;
        } else {
          _currentPage++;
        }

        if (questions.isEmpty) {
          if (currentState is MySavedQuestionsLoaded) {
            emit(currentState.copyWith(hasReachedMax: true));
          } else {
            emit(const MySavedQuestionsLoaded(questions: [], hasReachedMax: true));
          }
        } else {
          if (currentState is MySavedQuestionsLoaded) {
            emit(MySavedQuestionsLoaded(
              questions: currentState.questions + questions,
              hasReachedMax: _isLastPage,
            ));
          } else {
            emit(MySavedQuestionsLoaded(
              questions: questions,
              hasReachedMax: _isLastPage,
            ));
          }
        }
      },
    );
  }

  void _handleResetMySavedQuestions(
      ResetMySavedQuestionsEvent event, Emitter<MySavedQuestionsState> emit) {
    _currentPage = 1;
    _isLastPage = false;
    emit(MySavedQuestionsInitial());
  }

  void reset() {
    add(ResetMySavedQuestionsEvent());
  }

  int get currentPage => _currentPage;
}
