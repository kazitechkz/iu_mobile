import 'package:iu/core/utils/typedef.dart';

class AllNewsParameter {
  final int page;
  const AllNewsParameter({required this.page});
  DataMap toMap() {
    return {"page": page};
  }
}
