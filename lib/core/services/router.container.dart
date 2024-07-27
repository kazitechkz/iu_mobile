import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/common/widgets/scaffold_with_navigation.dart';
import 'package:iu/core/services/router_middleware.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';
import 'package:iu/features/attempt/presentation/attempt_work_over_failure/attempt_work_over_failure_screen.dart';
import 'package:iu/features/attempt/presentation/attempt_work_over_failure/bloc/attempt_work_over_failure_bloc.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_bloc.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/bloc/my_attempt_settings_bloc.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/my_attempt_settings_screen.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/google/google_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/kundelik/kundelik_bloc.dart';
import 'package:iu/features/auth/presentation/screens/auth_screen.dart';
import 'package:iu/features/auth/presentation/screens/forget_screen.dart';
import 'package:iu/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:iu/features/auth/presentation/screens/verify_screen.dart';
import 'package:iu/features/auth/presentation/widgets/kundelik_widget.dart';
import 'package:iu/features/career/domain/use_cases/get_career_quiz_group_list_case.dart';
import 'package:iu/features/career/presentation/career_quiz_detail/bloc/career_quiz_detail_bloc.dart';
import 'package:iu/features/career/presentation/career_quiz_detail/career_quiz_detail_screen.dart';
import 'package:iu/features/career/presentation/my_career_quiz_attempts/bloc/my_career_quiz_attempts_bloc.dart';
import 'package:iu/features/career/presentation/my_career_quiz_attempts/my_career_quiz_attempts_screen.dart';
import 'package:iu/features/career/presentation/pass_career_one/bloc/pass_career_one_bloc.dart';
import 'package:iu/features/career/presentation/pass_career_one/pass_career_one_screen.dart';
import 'package:iu/features/career/presentation/result_career_quiz/bloc/result_career_quiz_bloc.dart';
import 'package:iu/features/classroom/presentation/bloc/classroom_bloc.dart';
import 'package:iu/features/classroom/presentation/classroom_screen.dart';
import 'package:iu/features/forum/presentation/all_forum/all_forum_screen.dart';
import 'package:iu/features/forum/presentation/all_forum/bloc/all_forum_bloc.dart';
import 'package:iu/features/forum/presentation/forum_detail/bloc/forum_detail_bloc.dart';
import 'package:iu/features/forum/presentation/forum_detail/forum_detail_screen.dart';
import 'package:iu/features/iutube/presentation/iutube_detail/bloc/iutube_detail_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_detail/iutube_detail_screen.dart';
import 'package:iu/features/iutube/presentation/iutube_list/bloc/iutube_list_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_list/iutube_list_screen.dart';
import 'package:iu/features/iutube/presentation/iutube_main/bloc/iutube_main_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_main/iutube_main_screen.dart';
import 'package:iu/features/news/presentation/news_detail/bloc/news_detail_bloc.dart';
import 'package:iu/features/news/presentation/news_detail/news_detail_screen.dart';
import 'package:iu/features/news/presentation/news_list/bloc/important_news/important_news_bloc.dart';
import 'package:iu/features/news/presentation/news_list/bloc/news_list/news_list_bloc.dart';
import 'package:iu/features/news/presentation/news_list/news_list_screen.dart';
import 'package:iu/features/notification/presentation/notification_list/bloc/notification_list_bloc.dart';
import 'package:iu/features/notification/presentation/notification_list/notification_list_screen.dart';
import 'package:iu/features/payment/presentation/screens/payment_screen.dart';
import 'package:iu/features/profile/my_subscription/presentation/screens/my_subscription_screen.dart';
import 'package:iu/features/profile/profile_main_screen.dart';
import 'package:iu/features/question/presentation/my_saved_questions/bloc/my_saved_questions_bloc.dart';
import 'package:iu/features/question/presentation/my_saved_questions/screens/my_saved_question_screen.dart';
import 'package:iu/features/stat/presentation/full_stat/bloc/full_stat_bloc.dart';
import 'package:iu/features/stat/presentation/full_stat/full_stat_screen.dart';
import 'package:iu/features/stat/presentation/stat_attempt/bloc/stat_attempt_bloc.dart';
import 'package:iu/features/stat/presentation/stat_attempt/stat_attempt_screen.dart';
import 'package:iu/features/stat/presentation/stat_main/bloc/stat_main_bloc.dart';
import 'package:iu/features/stat/presentation/stat_main/stat_main_screen.dart';
import 'package:iu/features/steps/presentation/detail/bloc/step_detail_bloc.dart';
import 'package:iu/features/steps/presentation/detail/screens/step_detail_screen.dart';
import 'package:iu/features/steps/presentation/step/bloc/step_bloc.dart';
import 'package:iu/features/steps/presentation/step/screens/step_screen.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/check_sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/sub_step_detail_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/screen/sub_step_detail_screen.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/radio_bloc/exam_radio_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/sub_step_exam_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/screen/sub_step_exam_screen.dart';
import 'package:iu/features/sub_steps/presentation/result/bloc/sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/result/screen/sub_step_exam_result_screen.dart';
import 'package:iu/features/subscription/domain/use_cases/paybox_usecase.dart';
import 'package:iu/features/subscription/presentation/bloc/init_pay/init_pay_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/local_subject/local_subject_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/bloc/my_tech_support_tickets_bloc.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/my_tech_support_list_screen.dart';
import 'package:iu/features/techSupport/presentation/tech_support_detail/bloc/tech_support_detail_bloc.dart';
import 'package:iu/features/techSupport/presentation/tech_support_detail/tech_support_detail_screen.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/tournament_detail_screen.dart';
import 'package:iu/features/tournament/presentation/tournament_list/bloc/tournament_list_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_list/tournament_list_screen.dart';
import 'package:iu/features/unt/presentation/screens/unt_mode_screen.dart';
import 'package:iu/features/unt/presentation/unt_single/bloc/unt_Single_bloc.dart';
import 'package:iu/features/unt/presentation/unt_single/unt_single_screen.dart';
import 'package:iu/features/user/presentation/bloc/ava/change_ava_bloc.dart';
import '../../features/attempt/presentation/attempt_result/attempt_result_screen.dart';
import '../../features/attempt/presentation/pass_attempt/pass_attempt_screen.dart';
import '../../features/attempt_setting/domain/use_cases/my_attempt_setting_single_use_case.dart';
import '../../features/attempt_setting/domain/use_cases/my_attempt_settings_unt_use_case.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/career/presentation/career_quizzes/bloc/career_quizzes_bloc.dart';
import '../../features/career/presentation/career_quizzes/career_quizzes_screen.dart';
import '../../features/career/presentation/career_subscriptions/bloc/career_subscriptions_bloc.dart';
import '../../features/career/presentation/career_subscriptions/career_subscriptions_screen.dart';
import '../../features/career/presentation/pass_career_drag_drop/bloc/pass_career_drag_drop_bloc.dart';
import '../../features/career/presentation/pass_career_drag_drop/pass_career_drag_drop_screen.dart';
import '../../features/career/presentation/result_career_quiz/result_career_quiz_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/iutube/presentation/iutube_author/bloc/iutube_author_bloc.dart';
import '../../features/iutube/presentation/iutube_author/iutube_author_screen.dart';
import '../../features/question/domain/parameters/get_my_saved_questions_parameter.dart';
import '../../features/subscription/presentation/screen/subscription_screen.dart';
import '../../features/tournament/domain/parameters/get_tournament_awards_parameter.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_participants/sub_tournament_participants_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_results/sub_tournament_results_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_rivals/sub_tournament_rivals_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_awards/tournament_awards_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_detail_bloc.dart';
import '../../features/unt/presentation/unt_full/bloc/unt_full_bloc.dart';
import '../../features/unt/presentation/unt_full/unt_full_screen.dart';
import '../../features/user/presentation/bloc/change/change_user_info_bloc.dart';
import '../../features/user/presentation/bloc/user_info_bloc.dart';
import '../../features/user/presentation/screen/user_info_screen.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import '../common/models/pagination_parameter.dart';
import 'injection_main.container.dart';
part 'router.dart';