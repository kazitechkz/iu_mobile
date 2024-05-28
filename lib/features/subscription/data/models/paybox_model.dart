import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/subscription/domain/entities/paybox_entity.dart';

class PayBoxModel extends PayBoxEntity {
  const PayBoxModel({required super.pgStatus, required super.pgPaymentId, required super.pgRedirectUrl, required super.pgRedirectUrlType, required super.pgSalt, required super.pgSig});

  factory PayBoxModel.fromJson(DataMap map) {
    return PayBoxModel(
        pgStatus: map['pg_status'] as String,
        pgPaymentId: map['pg_payment_id'] as String,
        pgRedirectUrl: map['pg_redirect_url'] as String,
        pgRedirectUrlType: map['pg_redirect_url_type'] as String,
        pgSalt: map['pg_salt'] as String, 
        pgSig: map['pg_sig'] as String
    );
  }
}