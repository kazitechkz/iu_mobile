import 'package:equatable/equatable.dart';

class SubResultEntity extends Equatable {
  final int id;
  final int locale_id;
  final int sub_step_id;
  final int user_id;
  final String user_point;

  const SubResultEntity({
    required this.id,
    required this.locale_id,
    required this.sub_step_id,
    required this.user_id,
    required this.user_point
  });

  @override
  List<Object?> get props => [id, locale_id, sub_step_id, user_id, user_point];
}