import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/open_ai/domain/parameters/open_ai_params.dart';

abstract class OpenAiInterface {
  ResultFuture<String> getAiAnswer(OpenAiParams params);
}