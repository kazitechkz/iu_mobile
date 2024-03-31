import '../../../../core/utils/typedef.dart';

class SendResetTokenParameter {
  const SendResetTokenParameter({
    required this.email,
  });
  final String email;

  DataMap toMap() {
    return {
      "email": email,
    };
  }
}
