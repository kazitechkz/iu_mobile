import '../../../../core/utils/typedef.dart';

class RoomParameter{
  final String promo_code;
  final int subject_first;
  final int subject_second;

  const RoomParameter({required this.promo_code, required this.subject_first, required this.subject_second});

  DataMap toMap(){
    return {
      "promo_code":promo_code.toString(),
      "subject_first":subject_first.toString(),
      "subject_second":subject_second.toString(),
    };
  }

}