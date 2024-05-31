import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iu/core/adapters/auth_user_adapter.dart';
import 'package:iu/core/app_constants/hive_constant.dart';
import 'package:iu/core/interceptors/bearer_interceptor.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/features/appeal/data/datasources/appeal_datasources.dart';
import 'package:iu/features/appeal/data/repositories/appeal_repository.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';
import 'package:iu/features/appeal/domain/use_cases/appeal_by_id_use_case.dart';
import 'package:iu/features/appeal/domain/use_cases/appeal_type_use_case.dart';
import 'package:iu/features/appeal/domain/use_cases/appeal_use_case.dart';
import 'package:iu/features/appeal/domain/use_cases/create_appeal_use_case.dart';
import 'package:iu/features/attempt/data/repositories/attempt_repository.dart';
import 'package:iu/features/attempt/domain/use_cases/all_attempt_types_case.dart';
import 'package:iu/features/attempt/domain/use_cases/all_attempts_case.dart';
import 'package:iu/features/attempt/domain/use_cases/answer_case.dart';
import 'package:iu/features/attempt/domain/use_cases/answer_result_case.dart';
import 'package:iu/features/attempt/domain/use_cases/create_attempt_case.dart';
import 'package:iu/features/attempt/domain/use_cases/finish_attempt_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_by_promo_code_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_attempt_stat_case.dart';
import 'package:iu/features/attempt/domain/use_cases/get_unt_stat_case.dart';
import 'package:iu/features/attempt/domain/use_cases/save_question_case.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_bloc.dart';
import 'package:iu/features/attempt_setting/data/datasources/attempt_setting_datasource.dart';
import 'package:iu/features/attempt_setting/data/repositories/attempt_setting_repository.dart';
import 'package:iu/features/attempt_setting/domain/interfaces/attempt_setting_interface.dart';
import 'package:iu/features/attempt_setting/domain/use_cases/create_attempt_setting_use_case.dart';
import 'package:iu/features/attempt_setting/domain/use_cases/my_attempt_setting_single_use_case.dart';
import 'package:iu/features/attempt_setting/domain/use_cases/my_attempt_settings_unt_use_case.dart';
import 'package:iu/features/auth/data/datasources/auth_datasource.dart';
import 'package:iu/features/auth/data/repositories/auth_repository.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/usecases/forget_case.dart';
import 'package:iu/features/auth/domain/usecases/google_sign_in_case.dart';
import 'package:iu/features/auth/domain/usecases/send_reset_token_case.dart';
import 'package:iu/features/auth/domain/usecases/sign_in_case.dart';
import 'package:iu/features/auth/domain/usecases/sign_up_case.dart';
import 'package:iu/features/auth/domain/usecases/verify_case.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/google/google_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/kundelik/kundelik_bloc.dart';
import 'package:iu/features/battle/data/datasources/battle_datasource.dart';
import 'package:iu/features/battle/data/repositories/battle_repository.dart';
import 'package:iu/features/battle/domain/interface/battle_interface.dart';
import 'package:iu/features/career/data/datasources/career_datasource.dart';
import 'package:iu/features/career/data/repositories/career_repository.dart';
import 'package:iu/features/career/domain/interface/career_interface.dart';
import 'package:iu/features/career/domain/use_cases/finish_career_case.dart';
import 'package:iu/features/career/domain/use_cases/get_career_quiz_case.dart';
import 'package:iu/features/career/domain/use_cases/get_career_quiz_group_list_case.dart';
import 'package:iu/features/career/presentation/career_quiz_detail/bloc/career_quiz_detail_bloc.dart';
import 'package:iu/features/career/presentation/career_quizzes/career_quizzes_screen.dart';
import 'package:iu/features/career/presentation/career_subscriptions/bloc/career_subscriptions_bloc.dart';
import 'package:iu/features/career/presentation/my_career_quiz_attempts/bloc/my_career_quiz_attempts_bloc.dart';
import 'package:iu/features/career/presentation/pass_career_one/bloc/pass_career_one_bloc.dart';
import 'package:iu/features/career/presentation/result_career_quiz/bloc/result_career_quiz_bloc.dart';
import 'package:iu/features/category/data/datasources/category_datasources.dart';
import 'package:iu/features/category/data/repositories/category_repository.dart';
import 'package:iu/features/category/domain/interface/category_interface.dart';
import 'package:iu/features/category/domain/use_cases/category_usecase.dart';
import 'package:iu/features/fact/data/datasources/fact_datasource.dart';
import 'package:iu/features/fact/data/repositories/fact_repository.dart';
import 'package:iu/features/fact/domain/interface/fact_interface.dart';
import 'package:iu/features/fact/domain/use_cases/fact_usecase.dart';
import 'package:iu/features/forum/data/datasources/forum_datasource.dart';
import 'package:iu/features/forum/data/repositories/forum_repository.dart';
import 'package:iu/features/forum/domain/interface/forum_interface.dart';
import 'package:iu/features/forum/domain/use_cases/all_forum_case.dart';
import 'package:iu/features/forum/domain/use_cases/create_discuss_case.dart';
import 'package:iu/features/forum/domain/use_cases/create_forum_case.dart';
import 'package:iu/features/forum/domain/use_cases/get_forum_case.dart';
import 'package:iu/features/forum/domain/use_cases/get_forum_discuss_case.dart';
import 'package:iu/features/forum/domain/use_cases/rating_forum_case.dart';
import 'package:iu/features/forum/presentation/all_forum/bloc/all_forum_bloc.dart';
import 'package:iu/features/iutube/data/datasources/iutube_datasource.dart';
import 'package:iu/features/iutube/data/repositories/iutube_repository.dart';
import 'package:iu/features/iutube/domain/interface/iutube_interface.dart';
import 'package:iu/features/iutube/domain/use_cases/get_all_videos_case.dart';
import 'package:iu/features/iutube/domain/use_cases/get_main_videos_case.dart';
import 'package:iu/features/iutube/domain/use_cases/get_video_author_case.dart';
import 'package:iu/features/iutube/domain/use_cases/get_video_detail_case.dart';
import 'package:iu/features/iutube/presentation/iutube_detail/bloc/iutube_detail_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_main/bloc/iutube_main_bloc.dart';
import 'package:iu/features/news/data/datasources/news_datasource.dart';
import 'package:iu/features/news/data/repositories/news_repository.dart';
import 'package:iu/features/news/domain/interface/news_interface.dart';
import 'package:iu/features/news/domain/use_cases/all_news_case.dart';
import 'package:iu/features/news/domain/use_cases/get_important_news_case.dart';
import 'package:iu/features/news/domain/use_cases/get_single_news_case.dart';
import 'package:iu/features/news/presentation/news_detail/bloc/news_detail_bloc.dart';
import 'package:iu/features/news/presentation/news_list/bloc/important_news/important_news_bloc.dart';
import 'package:iu/features/notification/data/datasources/notification_datasource.dart';
import 'package:iu/features/notification/data/repositories/notification_repository.dart';
import 'package:iu/features/notification/domain/interface/notification_interface.dart';
import 'package:iu/features/notification/domain/use_cases/check_notification_case.dart';
import 'package:iu/features/notification/domain/use_cases/get_notification_all_case.dart';
import 'package:iu/features/notification/domain/use_cases/get_notification_type_case.dart';
import 'package:iu/features/notification/domain/use_cases/get_unread_message_count_case.dart';
import 'package:iu/features/notification/domain/use_cases/my_notification_ids_case.dart';
import 'package:iu/features/open_ai/data/datasources/open_ai_datasource.dart';
import 'package:iu/features/open_ai/data/repositories/open_ai_repository.dart';
import 'package:iu/features/open_ai/domain/interfaces/open_ai_interface.dart';
import 'package:iu/features/open_ai/domain/use_cases/open_ai_use_case.dart';
import 'package:iu/features/question/data/datasources/question_datasource.dart';
import 'package:iu/features/question/data/repositories/question_repository.dart';
import 'package:iu/features/question/domain/interface/question_interface.dart';
import 'package:iu/features/question/domain/use_cases/get_category_question_case.dart';
import 'package:iu/features/question/domain/use_cases/get_my_saved_question_by_id_case.dart';
import 'package:iu/features/question/domain/use_cases/get_my_saved_questions_case.dart';
import 'package:iu/features/question/domain/use_cases/get_sub_category_question_count_case.dart';
import 'package:iu/features/stat/data/datasources/stat_datasource.dart';
import 'package:iu/features/stat/data/repositories/stat_repository.dart';
import 'package:iu/features/stat/domain/interface/stat_interface.dart';
import 'package:iu/features/stat/presentation/full_stat/bloc/full_stat_bloc.dart';
import 'package:iu/features/stat/presentation/stat_attempt/bloc/stat_attempt_bloc.dart';
import 'package:iu/features/stat/presentation/stat_main/bloc/stat_main_bloc.dart';
import 'package:iu/features/steps/data/datasources/step_datasource.dart';
import 'package:iu/features/steps/data/repositories/step_repository.dart';
import 'package:iu/features/steps/domain/interface/step_interface.dart';
import 'package:iu/features/steps/domain/usecases/step_detail_usecase.dart';
import 'package:iu/features/steps/domain/usecases/step_usecase.dart';
import 'package:iu/features/steps/presentation/step/bloc/step_bloc.dart';
import 'package:iu/features/sub_steps/data/datasources/sub_step_datasource.dart';
import 'package:iu/features/sub_steps/data/repositories/sub_step_repository.dart';
import 'package:iu/features/sub_steps/domain/interface/sub_step_interface.dart';
import 'package:iu/features/sub_steps/domain/usecases/get_sub_step_exams_usecase.dart';
import 'package:iu/features/sub_steps/domain/usecases/pass_sub_step_exam_usecase.dart';
import 'package:iu/features/sub_steps/domain/usecases/sub_step_detail_usecase.dart';
import 'package:iu/features/sub_steps/domain/usecases/sub_step_usecase.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/check_sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/sub_step_detail_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/radio_bloc/exam_radio_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/sub_step_exam_bloc.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/bloc/sub_step_bloc.dart';
import 'package:iu/features/subject/data/datasources/subject_datasource.dart';
import 'package:iu/features/subject/data/repositories/subject_repository.dart';
import 'package:iu/features/subject/domain/interface/subject_interface.dart';
import 'package:iu/features/subject/domain/use_cases/subject_usecase.dart';
import 'package:iu/features/subscription/data/datasources/paybox_datasource.dart';
import 'package:iu/features/subscription/data/repositories/paybox_repository.dart';
import 'package:iu/features/subscription/domain/interface/paybox_interface.dart';
import 'package:iu/features/subscription/domain/use_cases/paybox_usecase.dart';
import 'package:iu/features/subscription/presentation/bloc/init_pay/init_pay_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/local_subject/local_subject_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/bloc/my_tech_support_tickets_bloc.dart';
import 'package:iu/features/tournament/data/datasources/tournament_datasource.dart';
import 'package:iu/features/tournament/data/repositories/tournament_repository.dart';
import 'package:iu/features/tournament/domain/interfaces/tournament_interface.dart';
import 'package:iu/features/tournament/domain/use_cases/create_tournament_case.dart';
import 'package:iu/features/tournament/presentation/tournament_list/bloc/tournament_list_bloc.dart';
import 'package:iu/features/unt/data/datasources/unt_datasource.dart';
import 'package:iu/features/unt/data/repositories/unt_repository.dart';
import 'package:iu/features/unt/domain/interfaces/unt_interface.dart';
import 'package:iu/features/unt/domain/use_cases/get_subjects_case.dart';
import 'package:iu/features/user/domain/use_cases/change_ava_case.dart';
import 'package:iu/features/user/presentation/bloc/ava/change_ava_bloc.dart';
import 'package:iu/features/user/presentation/bloc/change/change_user_info_bloc.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';
import 'package:iu/features/welcome/data/datasources/welcome_datasource.dart';
import 'package:iu/features/welcome/data/repositories/welcome_repository.dart';
import 'package:iu/features/welcome/domain/interfaces/welcome_interface.dart';
import 'package:iu/features/welcome/domain/usecases/cache_visited.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/attempt/data/datasources/attempt_datasource.dart';
import '../../features/attempt/domain/interface/attempt_interface.dart';
import '../../features/attempt/presentation/attempt_result/attempt_result_screen.dart';
import '../../features/auth/domain/usecases/kundelik_sign_in_case.dart';
import '../../features/battle/domain/use_cases/answer_battle_question_case.dart';
import '../../features/battle/domain/use_cases/create_battle_case.dart';
import '../../features/battle/domain/use_cases/create_battle_step_case.dart';
import '../../features/battle/domain/use_cases/finish_battle_result_case.dart';
import '../../features/battle/domain/use_cases/get_active_battles_case.dart';
import '../../features/battle/domain/use_cases/get_battle_by_promo_case.dart';
import '../../features/battle/domain/use_cases/get_battle_history_case.dart';
import '../../features/battle/domain/use_cases/get_battle_stats_case.dart';
import '../../features/battle/domain/use_cases/get_battle_step_case.dart';
import '../../features/battle/domain/use_cases/get_battle_step_questions_case.dart';
import '../../features/battle/domain/use_cases/get_battle_subjects_case.dart';
import '../../features/battle/domain/use_cases/join_to_battle_case.dart';
import '../../features/battle/domain/use_cases/my_active_battles_case.dart';
import '../../features/career/domain/use_cases/get_career_quizzes_case.dart';
import '../../features/career/domain/use_cases/my_career_attempts_case.dart';
import '../../features/career/domain/use_cases/pass_career_quiz_case.dart';
import '../../features/career/domain/use_cases/pay_career_case.dart';
import '../../features/career/domain/use_cases/result_career_quiz_case.dart';
import '../../features/career/presentation/career_quizzes/bloc/career_quizzes_bloc.dart';
import '../../features/iutube/presentation/iutube_author/bloc/iutube_author_bloc.dart';
import '../../features/iutube/presentation/iutube_list/bloc/iutube_list_bloc.dart';
import '../../features/news/presentation/news_list/bloc/news_list/news_list_bloc.dart';
import '../../features/stat/domain/use_cases/full_stat_case.dart';
import '../../features/stat/domain/use_cases/result_by_attempt_id_case.dart';
import '../../features/stat/domain/use_cases/stat_by_attempt_id_case.dart';
import '../../features/stat/domain/use_cases/stat_by_subject_id_case.dart';
import '../../features/steps/presentation/detail/bloc/step_detail_bloc.dart';
import '../../features/sub_category/data/datasources/sub_category_datasource.dart';
import '../../features/sub_category/data/repositories/sub_category_repository.dart';
import '../../features/sub_category/domain/interface/sub_category_interface.dart';
import '../../features/sub_category/domain/use_cases/sub_category_usecase.dart';
import '../../features/sub_steps/domain/usecases/check_exam_result_usecase.dart';
import '../../features/sub_steps/domain/usecases/get_sub_step_exam_result_usecase.dart';
import '../../features/sub_steps/presentation/result/bloc/sub_step_exam_result_bloc.dart';
import '../../features/techSupport/data/datasources/tech_support_datasource.dart';
import '../../features/techSupport/data/repositories/tech_support_repository.dart';
import '../../features/techSupport/domain/interface/tech_support_interface.dart';
import '../../features/techSupport/domain/use_cases/close_tech_support_ticket_case.dart';
import '../../features/techSupport/domain/use_cases/create_tech_support_message_case.dart';
import '../../features/techSupport/domain/use_cases/create_tech_support_ticket_case.dart';
import '../../features/techSupport/domain/use_cases/get_my_tech_support_tickets_case.dart';
import '../../features/techSupport/domain/use_cases/get_tech_support_categories_case.dart';
import '../../features/techSupport/domain/use_cases/get_tech_support_ticket_detail_case.dart';
import '../../features/techSupport/domain/use_cases/get_tech_support_types_case.dart';
import '../../features/tournament/domain/use_cases/get_all_tournament_case.dart';
import '../../features/tournament/domain/use_cases/get_list_of_tournaments_case.dart';
import '../../features/tournament/domain/use_cases/get_sub_tournament_detail_case.dart';
import '../../features/tournament/domain/use_cases/get_sub_tournament_participants_case.dart';
import '../../features/tournament/domain/use_cases/get_sub_tournament_results_case.dart';
import '../../features/tournament/domain/use_cases/get_sub_tournament_rivals_case.dart';
import '../../features/tournament/domain/use_cases/get_sub_tournament_winners_case.dart';
import '../../features/tournament/domain/use_cases/get_tournament_awards_case.dart';
import '../../features/tournament/domain/use_cases/get_tournament_detail_case.dart';
import '../../features/tournament/domain/use_cases/on_participate_tournament_case.dart';
import '../../features/tournament/domain/use_cases/on_pay_tournament_case.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_participants/sub_tournament_participants_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_results/sub_tournament_results_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_rivals/sub_tournament_rivals_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_awards/tournament_awards_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_detail_bloc.dart';
import '../../features/unt/presentation/unt_full/bloc/unt_full_bloc.dart';
import '../../features/unt/presentation/unt_single/bloc/unt_Single_bloc.dart';
import '../../features/user/data/datasources/user_datasource.dart';
import '../../features/user/data/repositories/user_repository.dart';
import '../../features/user/domain/interface/user_interface.dart';
import '../../features/user/domain/use_cases/account_case.dart';
import '../../features/user/domain/use_cases/account_change_case.dart';
import '../../features/user/domain/use_cases/find_user_by_email_case.dart';
import '../../features/welcome/domain/usecases/check_is_first_time.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
part 'injection_main.dart';
