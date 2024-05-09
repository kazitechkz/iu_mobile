import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/news_entity.dart';
import '../../../../domain/use_cases/get_important_news_case.dart';

part 'important_news_event.dart';
part 'important_news_state.dart';

class ImportantNewsBloc extends Bloc<ImportantNewsEvent, ImportantNewsState> {
  ImportantNewsBloc({required GetImportantNewsCase getImportantNewsCase})
      : _getImportantNewsCase = getImportantNewsCase,
        super(ImportantNewsInitialState()) {
    on<ImportantNewsGetEvent>(_handleImportantNewsGetEvent);
  }

  final GetImportantNewsCase _getImportantNewsCase;

  Future<void> _handleImportantNewsGetEvent(
      ImportantNewsGetEvent event, Emitter<ImportantNewsState> emit) async {
    emit(ImportantNewsLoadingState());
    final result = await _getImportantNewsCase();
    result.fold(
        (l) => emit(ImportantNewsFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(ImportantNewsSuccessState(r)));
  }
}
