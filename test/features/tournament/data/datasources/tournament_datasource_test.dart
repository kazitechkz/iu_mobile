// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:iu/core/app_constants/api_constant.dart';
// import 'package:iu/core/common/models/pagination_data.dart';
// import 'package:iu/core/common/models/response_data.dart';
// import 'package:iu/core/interceptors/bearer_interceptor.dart';
// import 'package:iu/core/services/injection_main.container.dart';
// import 'package:iu/core/utils/http_utils.dart';
// import 'package:iu/features/tournament/data/models/get_all_tournament_model.dart';
// import 'package:iu/features/tournament/data/models/get_subtournament_detail_model.dart';
// import 'package:iu/features/tournament/data/models/get_subtournament_results_model.dart';
// import 'package:iu/features/tournament/data/models/get_tournament_detail_model.dart';
// import 'package:iu/features/tournament/data/models/sub_tournament_participant_model.dart';
// import 'package:iu/features/tournament/data/models/sub_tournament_result_model.dart';
// import 'package:iu/features/tournament/data/models/sub_tournament_rival_model.dart';
// import 'package:iu/features/tournament/data/models/sub_tournament_winner_model.dart';
// import 'package:iu/features/tournament/data/models/tournament_award_model.dart';
// import 'package:iu/features/tournament/data/models/tournament_model.dart';
// import 'package:iu/features/tournament/domain/entities/get_subtournament_detail_entity.dart';
// import 'package:iu/features/tournament/domain/entities/get_tournament_detail_entity.dart';
// import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';
// import 'package:iu/features/tournament/domain/parameters/get_list_of_tournaments_parameter.dart';
// import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_participant_parameter.dart';
// import 'package:iu/features/tournament/domain/parameters/get_sub_tournament_results_parameter.dart';
// import 'package:iu/features/tournament/domain/parameters/get_tournament_awards_parameter.dart';
//
// Future<void> main() async {
//   BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 5),
//       receiveTimeout: const Duration(seconds: 5),
//       headers: {'Accept': "application/json;"},
//       contentType: "application/json;charset=utf-8",
//       responseType: ResponseType.json);
//   final dio = Dio(options);
//   dio.interceptors.add(BearerTokenInterceptor(
//       "793|BX4ahr9BoS9jqFMgBHKleq8z0N1Ou2rC3JidIm0qd26f69c2"));
//   sl.registerLazySingleton<Dio>(() => dio);
//
//   final response =
//       await HttpUtil().get(ApiConstant.getSubTournamentWinners + 45.toString());
//   final responseData = ResponseData.fromJson(response);
//   final result = SubTournamentWinnerModel.fromMapList(
//       responseData.data.cast<Map<String, dynamic>>());
//   print(result);
//   // final result = PaginationData.fromType(
//   //     paginationData,
//   //     SubTournamentResultModel.fromMapList(
//   //         paginationData.data.cast<Map<String, dynamic>>()));
// }
