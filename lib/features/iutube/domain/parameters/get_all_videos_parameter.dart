import 'package:iu/core/utils/typedef.dart';

class GetAllVideosParameter {
  final int page;
  final int? subjectId;
  final int? localeId;
  final String? search;

  const GetAllVideosParameter(
      {required this.page, this.subjectId, this.localeId, this.search});

  DataMap toMap() {
    DataMap map = {"page": page.toString()};
    if (this.subjectId != null) {
      map["subject_id"] = this.subjectId.toString();
    }
    if (this.search != null) {
      map["search"] = this.search.toString();
    }
    if (this.localeId != null) {
      map["locale_id"] = this.localeId.toString();
    }
    return map;
  }
}
