import 'package:iu/core/utils/typedef.dart';

class AllForumParameter {
  final String? type;
  final int page;
  final int? subjectId;
  final String? search;

  const AllForumParameter(
      {this.type, required this.page, this.subjectId, this.search});

  DataMap toMap() {
    DataMap data = {"page": page.toString()};
    if (type != null) {
      data["type"] = type.toString();
    }
    if (subjectId != null) {
      data["subject_id"] = subjectId.toString();
    }
    if (search != null) {
      data["search"] = search.toString();
    }
    return data;
  }
}
