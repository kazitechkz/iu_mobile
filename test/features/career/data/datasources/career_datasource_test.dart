import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iu/core/app_constants/api_constant.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/services/injection_main.container.dart';
import 'package:iu/core/utils/http_utils.dart';
import 'package:iu/features/battle/data/models/battle_answer_result_model.dart';
import 'package:iu/features/battle/data/models/battle_model.dart';
import 'package:iu/features/battle/data/models/battle_step_question_model.dart';
import 'package:iu/features/battle/data/models/finish_battle_result_model.dart';
import 'package:iu/features/battle/data/models/get_battle_stats_model.dart';
import 'package:iu/features/battle/data/models/given_battle_question_model.dart';
import 'package:iu/features/battle/data/models/propose_subject_for_battle_model.dart';
import 'package:iu/features/battle/domain/entities/battle_entity.dart';
import 'package:iu/features/battle/domain/entities/propose_subject_for_battle_entity.dart';
import 'package:iu/features/battle/domain/parameters/answer_battle_question_parameter.dart';
import 'package:iu/features/battle/domain/parameters/create_battle_parameter.dart';
import 'package:iu/features/battle/domain/parameters/create_battle_step_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_active_battles_parameter.dart';
import 'package:iu/features/battle/domain/parameters/get_battle_history_parameter.dart';
import 'package:iu/features/battle/domain/parameters/join_to_battle_parameter.dart';
import 'package:iu/features/career/data/models/career_quiz_attempt_model.dart';
import 'package:iu/features/career/data/models/career_quiz_model.dart';
import 'package:iu/features/career/data/models/get_career_quiz_group_list_model.dart';
import 'package:iu/features/career/data/models/get_career_quiz_model.dart';
import 'package:iu/features/career/data/models/get_career_quizzes_model.dart';
import 'package:iu/features/career/domain/parameters/finish_career_quiz_parameter.dart';
import 'package:iu/features/career/domain/parameters/get_career_quizzes_parameter.dart';
import 'package:iu/features/career/domain/parameters/my_career_attempts_parameter.dart';
import 'package:iu/features/career/domain/parameters/pay_career_parameter.dart';
import 'package:iu/features/tournament/data/models/sub_tournament_winner_model.dart';

Future<void> main() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json;"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  String userOne = "727|Xqz6up1QlOVurDx8yD4GLksEkqCnDOvynnTevSM7d89d8ed0";
  String userTwo = "728|Aojj066JSNJt7I0DT0BcCMOmtdD1CCLd99hLe8OB80091cab";
  dio.interceptors.add(BearerTokenInterceptor(
      userOne));
  sl.registerLazySingleton<Dio>(() => dio);
  FinishCareerQuizParameter finishCareerQuizParameter =
  FinishCareerQuizParameter(quiz_id: 9,
      given_answers: '''
  {
    "51":{"1":65,"2":70,"3":66,"4":69,"5":68,"6":67,"7":64},
    "52":{"1":75,"2":77,"3":71,"4":76,"5":74,"6":73,"7":72},
    "53":{"1":78,"2":79,"3":84,"4":83,"5":82,"6":80,"7":81},
    "54":{"1":85,"2":91,"3":90,"4":89,"5":88,"6":87,"7":86},
    "55":{"1":92,"2":98,"3":97,"4":96,"5":95,"6":94,"7":93},
    "56":{"1":99,"2":105,"3":104,"4":103,"5":102,"6":101,"7":100},
    "57":{"1":106,"2":111,"3":112,"4":110,"5":109,"6":107,"7":108},
    "58":{"1":117,"2":116,"3":119,"4":118,"5":113,"6":115,"7":114}
  }
  ''');
  final response = await HttpUtil().post(ApiConstant.finishCareerQuiz,data: finishCareerQuizParameter.toMap());
  final responseData = ResponseData<int>.fromJson(response);
  print(responseData.data);


}