import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iu/core/adapters/auth_user_adapter.dart';
import 'package:iu/core/interceptors/error_interceptor.dart';
import 'package:iu/features/auth/data/datasources/auth_datasource.dart';
import 'package:iu/features/auth/data/repositories/auth_repository.dart';
import 'package:iu/features/auth/domain/interface/auth_interface.dart';
import 'package:iu/features/auth/domain/usecases/forget_case.dart';
import 'package:iu/features/auth/domain/usecases/send_reset_token_case.dart';
import 'package:iu/features/auth/domain/usecases/sign_in_case.dart';
import 'package:iu/features/auth/domain/usecases/sign_up_case.dart';
import 'package:iu/features/auth/domain/usecases/verify_case.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/welcome/data/datasources/welcome_datasource.dart';
import 'package:iu/features/welcome/data/repositories/welcome_repository.dart';
import 'package:iu/features/welcome/domain/interfaces/welcome_interface.dart';
import 'package:iu/features/welcome/domain/usecases/cache_visited.dart';

import '../../features/welcome/domain/usecases/check_is_first_time.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
part 'injection_main.dart';
