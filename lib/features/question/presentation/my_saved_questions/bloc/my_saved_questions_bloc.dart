import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';

import '../../../../../core/common/models/pagination_data.dart';
import '../../../../attempt/domain/entities/question_entity.dart';
import '../../../domain/parameters/get_my_saved_questions_parameter.dart';
import '../../../domain/use_cases/get_my_saved_questions_case.dart';

part 'my_saved_questions_event.dart';
part 'my_saved_questions_state.dart';

class MySavedQuestionsBloc extends Bloc<MySavedQuestionsEvent, MySavedQuestionsState> {
  final GetMySavedQuestionsCase _getMySavedQuestionsCase;
  int _currentPage = 1;
  bool _isLastPage = false;
  MySavedQuestionsBloc({required GetMySavedQuestionsCase useCase}) : _getMySavedQuestionsCase = useCase, super(MySavedQuestionsInitial()) {
    on<GetMySavedQuestionsEvent>(_handleGetMySavedQuestions);
    on<ResetMySavedQuestionsEvent>(_handleResetMySavedQuestions);
  }

  Future<void> _handleGetMySavedQuestions(GetMySavedQuestionsEvent event, Emitter<MySavedQuestionsState> emit) async {
    if (_isLastPage) return;
    final currentState = state;
    emit(MySavedQuestionsLoading());
    final result = await _getMySavedQuestionsCase(event.params.copyWith(page: _currentPage));
    result.fold(
            (l) => emit(MySavedQuestionsError(FailureData.fromApiFailure(l))),
            (paginationData) {
        final questions = paginationData.data;
        if (questions.isEmpty || _currentPage >= paginationData.lastPage) {
          _isLastPage = true;
        } else {
          _currentPage++;
        }

        if (currentState is MySavedQuestionsLoaded) {
          final combinedQuestions = PaginationData<List<QuestionEntity>>(
            currentPage: paginationData.currentPage,
            data: currentState.questions.data + questions,
            firstPageUrl: paginationData.firstPageUrl,
            from: paginationData.from,
            lastPage: paginationData.lastPage,
            lastPageUrl: paginationData.lastPageUrl,
            links: paginationData.links,
            nextPageUrl: paginationData.nextPageUrl,
            path: paginationData.path,
            perPage: paginationData.perPage,
            prevPageUrl: paginationData.prevPageUrl,
            to: paginationData.to,
            total: paginationData.total,
          );
          emit(MySavedQuestionsLoaded(combinedQuestions));
        } else {
          emit(MySavedQuestionsLoaded(paginationData));
        }
      },
    );
  }
  void _handleResetMySavedQuestions(ResetMySavedQuestionsEvent event, Emitter<MySavedQuestionsState> emit) {
    _currentPage = 1;
    _isLastPage = false;
    emit(MySavedQuestionsInitial());
  }

  void reset() {
    add(ResetMySavedQuestionsEvent());
  }

  int get currentPage => _currentPage;
}
