// import 'package:dio/dio.dart';
// import 'package:iu/core/app_constants/api_constant.dart';
// import 'package:iu/core/common/models/pagination_data.dart';
// import 'package:iu/core/common/models/response_data.dart';
// import 'package:iu/core/interceptors/bearer_interceptor.dart';
// import 'package:iu/core/services/injection_main.container.dart';
// import 'package:iu/core/utils/http_utils.dart';
// import 'package:iu/features/battle/data/models/battle_answer_result_model.dart';
// import 'package:iu/features/battle/data/models/battle_model.dart';
// import 'package:iu/features/battle/data/models/battle_step_question_model.dart';
// import 'package:iu/features/battle/data/models/finish_battle_result_model.dart';
// import 'package:iu/features/battle/data/models/get_battle_stats_model.dart';
// import 'package:iu/features/battle/data/models/given_battle_question_model.dart';
// import 'package:iu/features/battle/data/models/propose_subject_for_battle_model.dart';
// import 'package:iu/features/battle/domain/entities/battle_entity.dart';
// import 'package:iu/features/battle/domain/entities/propose_subject_for_battle_entity.dart';
// import 'package:iu/features/battle/domain/parameters/answer_battle_question_parameter.dart';
// import 'package:iu/features/battle/domain/parameters/create_battle_parameter.dart';
// import 'package:iu/features/battle/domain/parameters/create_battle_step_parameter.dart';
// import 'package:iu/features/battle/domain/parameters/get_active_battles_parameter.dart';
// import 'package:iu/features/battle/domain/parameters/get_battle_history_parameter.dart';
// import 'package:iu/features/battle/domain/parameters/join_to_battle_parameter.dart';
// import 'package:iu/features/tournament/data/models/sub_tournament_winner_model.dart';
//
// Future<void> main() async {
//   BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {'Accept': "application/json;"},
//       contentType: "application/json;charset=utf-8",
//       responseType: ResponseType.json);
//   final dio = Dio(options);
//   String userOne = "727|Xqz6up1QlOVurDx8yD4GLksEkqCnDOvynnTevSM7d89d8ed0";
//   String userTwo = "728|Aojj066JSNJt7I0DT0BcCMOmtdD1CCLd99hLe8OB80091cab";
//   dio.interceptors.add(BearerTokenInterceptor(
//       userTwo));
//   sl.registerLazySingleton<Dio>(() => dio);
//   final response = await HttpUtil().get(ApiConstant.finishBattleResult + 86.toString());
//   final responseData = ResponseData.fromJson(response);
//   FinishBattleResultModel result = FinishBattleResultModel.fromMap(responseData.data);
//   print(result);
// }