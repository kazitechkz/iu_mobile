import 'package:iu/core/utils/typedef.dart';

class PayBoxRequest {
  final int firstSubject;
  final int secondSubject;
  final int period;

  const PayBoxRequest(this.firstSubject, this.secondSubject, this.period);

  DataMap toJson() {
    return {
    'subject_first': firstSubject ,
    'subject_second': secondSubject ,
    'time': period
    };
  }
}