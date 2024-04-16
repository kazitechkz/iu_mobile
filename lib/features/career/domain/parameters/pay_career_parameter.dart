import 'package:iu/core/utils/typedef.dart';

class PayCareerParameter {
  final int? career_quiz_id;
  final int? career_group_id;
  final String? promo;

  const PayCareerParameter({
    this.career_quiz_id,
    this.career_group_id,
    this.promo,
  });

  DataMap toMap(){
    DataMap map = {};
    if(career_quiz_id != null){
      map["career_quiz_id"] = career_quiz_id.toString();
    }
    if(career_group_id != null){
      map["career_group_id"] = career_group_id.toString();
    }
    if(promo!= null){
      map["promo"] = promo.toString();
    }
    return map;
  }
}
