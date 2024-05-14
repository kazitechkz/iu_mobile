import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../../core/services/injection_main.container.dart';
import '../../../../domain/parameters/pass_sub_step_exam_params.dart';
import '../../../../domain/usecases/pass_sub_step_exam_usecase.dart';

part 'exam_radio_event.dart';
part 'exam_radio_state.dart';

class ExamRadioBloc extends Bloc<ExamRadioEvent, ExamRadioInitial> {
  final PassSubStepExamUseCase _passSubStepExamUseCase;
  ExamRadioBloc({required PassSubStepExamUseCase useCase}) : _passSubStepExamUseCase = useCase, super(const ExamRadioInitial()) {
    on<AnswerSelected>((event, emit) {
      List<PassSubStepExamParams> newAnswers = List<PassSubStepExamParams>.from(state.answers);
      // Проверяем, существует ли уже ответ для данного индекса
      if (event.index < newAnswers.length) {
        // Обновляем существующий ответ
        newAnswers[event.index] = event.params;
      } else {
        // Если индекс больше текущего размера списка, добавляем необходимое количество элементов
        for (int i = newAnswers.length; i <= event.index; i++) {
          newAnswers.add(PassSubStepExamParams(answer: '', localeId: 1, subStepTestId: 0)); // Добавляем пустые элементы для заполнения
        }
        newAnswers[event.index] = event.params; // Устанавливаем ответ на правильную позицию
      }
      emit(state.copyWith(answers: newAnswers));
    });

    on<UpdateAnswers>((event, emit) {
      // Просто эмитируем новое состояние с обновленным списком ответов
      emit(state.copyWith(answers: event.updatedAnswers));
    });

    on<SubmitAnswers>(submitAnswers);
  }

  Future<void> submitAnswers(SubmitAnswers event, Emitter<ExamRadioInitial> emit) async {
    try {
      // Фильтрация списка, исключая пустые или неинициализированные ответы
      List<PassSubStepExamParams> filteredAnswers = state.answers
          .where((answer) => answer.answer.trim().isNotEmpty)
          .toList();

      final result = await _passSubStepExamUseCase(filteredAnswers);
      result.fold((l) => null, (r) => null);
    } catch (e, st) {
      sl<Talker>().handle(e, st);
    }
  }
}
