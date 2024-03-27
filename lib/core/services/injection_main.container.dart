import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iu/features/welcome/data/datasources/welcome_datasource.dart';
import 'package:iu/features/welcome/data/repositories/welcome_repository.dart';
import 'package:iu/features/welcome/domain/interfaces/welcome_interface.dart';
import 'package:iu/features/welcome/domain/usecases/cache_visited.dart';

import '../../features/welcome/domain/usecases/check_is_first_time.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
part 'injection_main.dart';