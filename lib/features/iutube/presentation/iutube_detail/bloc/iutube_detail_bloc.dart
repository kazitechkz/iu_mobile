import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/get_video_detail_entity.dart';
import '../../../domain/parameters/get_video_detail_parameter.dart';
import '../../../domain/use_cases/get_video_detail_case.dart';
import 'iutube_detail_bloc.dart';

part 'iutube_detail_event.dart';
part 'iutube_detail_state.dart';

class IutubeDetailBloc extends Bloc<IutubeDetailEvent, IutubeDetailState> {
  IutubeDetailBloc({required GetVideoDetailCase getVideoDetailCase})
      : _getVideoDetailCase = getVideoDetailCase,
        super(IutubeDetailInitialState()) {
    on<IutubeDetailByAliasEvent>(_handleIutubeDetailByAliasEvent);
  }

  final GetVideoDetailCase _getVideoDetailCase;

  Future<void> _handleIutubeDetailByAliasEvent(
      IutubeDetailByAliasEvent event, Emitter<IutubeDetailState> emit) async {
    emit(IutubeDetailLoadingState());
    final result = await _getVideoDetailCase(event.parameter);
    result.fold(
        (l) => emit(IutubeDetailFailedState(FailureData.fromApiFailure(l))),
        (r) => emit(IutubeDetailSuccessState(r)));
  }
}
