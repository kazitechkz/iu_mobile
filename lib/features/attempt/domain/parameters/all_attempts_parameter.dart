import '../../../../core/utils/typedef.dart';

class AllAttemptsParameter {
  final int? page;
  const AllAttemptsParameter({this.page = 1});

  DataMap toMap() {
    return {
      "page": this.page ?? 1,
    };
  }
}
