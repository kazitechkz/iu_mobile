import 'package:equatable/equatable.dart';
import 'package:iu/core/utils/typedef.dart';

abstract class WelcomeInterface{
  const WelcomeInterface();
  ResultFuture<bool> checkIsFirstTime();
  ResultFutureVoid cacheVisited();
}