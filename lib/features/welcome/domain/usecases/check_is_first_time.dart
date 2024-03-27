import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../interfaces/welcome_interface.dart';

class CheckIsFirstTimeCase extends UseCaseWithoutParams<bool>{
  final WelcomeInterface welcomeInterface;
  const CheckIsFirstTimeCase(this.welcomeInterface);
  @override
  ResultFuture<bool> call() {
    return welcomeInterface.checkIsFirstTime();
  }
}