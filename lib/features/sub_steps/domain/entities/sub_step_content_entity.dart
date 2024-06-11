import 'package:equatable/equatable.dart';
import 'package:iu/core/mixins/text_mixin.dart';

import '../../../../core/mixins/content_mixin.dart';

class SubStepContentEntity extends Equatable with TextMixin {
  final int id;
  final String text_ru;
  final String text_kk;
  final int is_active;

  const SubStepContentEntity({
    required this.id,
    required this.text_kk,
    required this.text_ru,
    required this.is_active
  });

  @override
  List<Object?> get props => [id, text_kk, text_ru, is_active];

  @override
  String? getTextKk() => text_kk;

  @override
  String? getTextRu() => text_ru;
}