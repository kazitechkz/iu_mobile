import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class PayEntity extends Equatable {
  final String? pgErrorDescription;
  final String pgStatus;
  final String pgPaymentId;
  final String pgRedirectUrl;
  final String pgRedirectUrlType;
  final String pgSalt;
  final String pgSig;

  const PayEntity(
      {this.pgErrorDescription,
      required this.pgStatus,
      required this.pgPaymentId,
      required this.pgRedirectUrl,
      required this.pgRedirectUrlType,
      required this.pgSalt,
      required this.pgSig});

  @override
  List<Object?> get props => [
        pgErrorDescription,
        pgStatus,
        pgPaymentId,
        pgRedirectUrl,
        pgRedirectUrlType,
        pgSalt,
        pgSig
      ];
}

class PayModel extends PayEntity {
  const PayModel(
      {super.pgErrorDescription,
      required super.pgStatus,
      required super.pgPaymentId,
      required super.pgRedirectUrl,
      required super.pgRedirectUrlType,
      required super.pgSalt,
      required super.pgSig});

  factory PayModel.fromJson(Map<String, dynamic> json) {
    return PayModel.fromMap(json);
  }
  PayModel.fromMap(DataMap map)
      : this(
            pgErrorDescription: map["pg_error_description"],
            pgStatus: map["pg_status"],
            pgPaymentId: map["pg_payment_id"],
            pgRedirectUrl: map["pg_redirect_url"],
            pgRedirectUrlType: map["pg_redirect_url_type"],
            pgSalt: map["pg_salt"],
            pgSig: map["pg_sig"]);
  static List<PayModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => PayModel.fromMap(map)).toList();
  }
}
