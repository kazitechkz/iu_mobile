import '../../domain/entities/sub_step_video_entity.dart';

class SubStepVideoModel extends SubStepVideoEntity {
  const SubStepVideoModel(
      {required super.id, required super.sub_step_id, required super.url});

  factory SubStepVideoModel.fromJson(Map<String, dynamic> json) {
    return SubStepVideoModel(
        id: json['id'] as int,
        sub_step_id: json['sub_step_id'] as int,
        url: json['url'] as String);
  }
}