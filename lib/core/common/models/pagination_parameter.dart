import '../../utils/typedef.dart';

class PaginationParameter {
  final int page;
  const PaginationParameter({required this.page});
  DataMap toMap() {
    return {"page": page};
  }
}