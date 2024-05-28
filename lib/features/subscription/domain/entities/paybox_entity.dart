import 'package:equatable/equatable.dart';

class PayBoxEntity extends Equatable {
  final String pgStatus;
  final String pgPaymentId;
  final String pgRedirectUrl;
  final String pgRedirectUrlType;
  final String pgSalt;
  final String pgSig;
  const PayBoxEntity({required this.pgStatus, required this.pgPaymentId, required this.pgRedirectUrl, required this.pgRedirectUrlType, required this.pgSalt, required this.pgSig});
  @override
  // TODO: implement props
  List<Object?> get props => [pgStatus, pgPaymentId, pgRedirectUrl, pgRedirectUrlType, pgSalt, pgSig];

}