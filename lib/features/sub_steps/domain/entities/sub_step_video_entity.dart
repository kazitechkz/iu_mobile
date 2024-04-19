import 'package:equatable/equatable.dart';

class SubStepVideoEntity extends Equatable {
  final int id;
  final int sub_step_id;
  final String url;

  const SubStepVideoEntity({
    required this.id,
    required this.sub_step_id,
    required this.url
  });

  @override
  List<Object?> get props => [id, sub_step_id, url];
}