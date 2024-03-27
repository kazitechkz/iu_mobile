import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../interfaces/welcome_interface.dart';

class CacheVisitedCase extends UseCaseWithoutParams<void>{
  final WelcomeInterface welcomeInterface;
  const CacheVisitedCase(this.welcomeInterface);
  @override
  ResultFutureVoid call() {
    return welcomeInterface.cacheVisited();
  }

}