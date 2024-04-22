import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/open_ai/domain/interfaces/open_ai_interface.dart';
import 'package:iu/features/open_ai/domain/parameters/open_ai_params.dart';

class OpenAiUseCase extends UseCaseWithParams<String, OpenAiParams> {
  final OpenAiInterface openAiInterface;
  OpenAiUseCase(this.openAiInterface);
  @override
  ResultFuture<String> call(OpenAiParams params) async {
    return await openAiInterface.getAiAnswer(params);
  }

}