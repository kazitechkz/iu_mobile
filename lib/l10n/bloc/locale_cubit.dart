import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/core/utils/hive_utils.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('ru')));

  void toKazakh() {
    HiveUtils().setString('locale', 'kk');
    emit(const LocaleState(Locale('kk')));
  }
  void toRussian() {
    HiveUtils().setString('locale', 'ru');
    emit(const LocaleState(Locale('ru')));
  }
}
