import 'package:iu/core/utils/typedef.dart';

class PassSubStepParameter{
  final int sub_category_id;
  const PassSubStepParameter({required this.sub_category_id});
  DataMap toMap(){
    return {
      "sub_category_id" : sub_category_id.toString()
    };
  }
}