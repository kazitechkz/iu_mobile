import 'package:iu/core/utils/typedef.dart';

class GetVideoDetailParameter {
  final String alias;

  const GetVideoDetailParameter({
    required this.alias
  });
  DataMap toMap(){
    return {
      "alias":alias.toString()
    };
  }
}