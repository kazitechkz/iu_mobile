import 'package:iu/core/utils/typedef.dart';

class AppealParams {
  final int page;
  const AppealParams({required this.page});
  DataMap toMap() {
    return {"page": page};
  }
}
