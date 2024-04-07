import 'package:iu/features/tournament/data/models/sub_tournament_participant_model.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_result_model.dart';
import 'package:iu/features/tournament/data/models/tournament_step_model.dart';
import 'package:iu/features/tournament/domain/entities/sub_tournament_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tournament_step_entity.dart';

class SubTournamentModel extends SubTournamentEntity {
  const SubTournamentModel(
      {required super.id,
      required super.tournamentId,
      required super.stepId,
      required super.questionQuantity,
      required super.maxPoint,
      required super.singleQuestionQuantity,
      required super.multipleQuestionQuantity,
      required super.contextQuestionQuantity,
      required super.isFinished,
      required super.isCurrent,
      required super.time,
      required super.startAt,
      required super.endAt,
      super.tournament,
      TournamentStepModel? super.tournamentStep,
      List<SubTournamentResultModel>? super.subTournamentResults,
      List<SubTournamentParticipantModel>? super.subtournamentParticipants});

  SubTournamentModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          tournamentId: map["tournament_id"],
          stepId: map["step_id"],
          questionQuantity: map["question_quantity"],
          maxPoint: map["max_point"],
          singleQuestionQuantity: map["single_question_quantity"],
          multipleQuestionQuantity: map["multiple_question_quantity"],
          contextQuestionQuantity: map["context_question_quantity"],
          isFinished: map["is_finished"],
          isCurrent: map["is_current"],
          time: map["time"],
          startAt: map["start_at"],
          endAt: map["end_at"],
          tournamentStep: map["tournament_step"] != null
              ? TournamentStepModel.fromMap(map["tournament_step"])
              : null,
          subTournamentResults: map["sub_tournament_results"] != null
              ? SubTournamentResultModel.fromMapList(
                  map["sub_tournament_results"].cast<Map<String, dynamic>>())
              : null,
          subtournamentParticipants: map["subtournament_participants"] != null
              ? SubTournamentParticipantModel.fromMapList(
                  map["subtournament_participants"]
                      .cast<Map<String, dynamic>>())
              : null,
        );

  factory SubTournamentModel.fromJson(Map<String, dynamic> json) {
    return SubTournamentModel.fromMap(json);
  }

  static List<SubTournamentModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubTournamentModel.fromMap(map)).toList();
  }
}
