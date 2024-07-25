import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_questions_parameter.dart';
import 'package:iu/features/question/presentation/my_saved_questions/bloc/my_saved_questions_bloc.dart';
import '../widgets/saved_question_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MySavedQuestionScreen extends StatefulWidget {
  const MySavedQuestionScreen({super.key});

  @override
  State<MySavedQuestionScreen> createState() => _MySavedQuestionScreenState();
}

class _MySavedQuestionScreenState extends State<MySavedQuestionScreen> {
  final ScrollController _scrollController = ScrollController();
  GetMySavedQuestionsParameter params = const GetMySavedQuestionsParameter(page: 1);

  @override
  void initState() {
    super.initState();
    _resetPaging();
    context.read<MySavedQuestionsBloc>().add(GetMySavedQuestionsEvent(params));
    _scrollController.addListener(_onScroll);
  }

  void _resetPaging() {
    context.read<MySavedQuestionsBloc>().reset();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isLoading && !_hasReachedMax) {
      context.read<MySavedQuestionsBloc>().add(GetMySavedQuestionsEvent(params.copyWith(page: context.read<MySavedQuestionsBloc>().currentPage + 1)));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isLoading {
    final currentState = context.read<MySavedQuestionsBloc>().state;
    return currentState is MySavedQuestionsLoading;
  }

  bool get _hasReachedMax {
    final currentState = context.read<MySavedQuestionsBloc>().state;
    return currentState is MySavedQuestionsLoaded && currentState.hasReachedMax;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: AppLocalizations.of(context)!.appbar_my_questions,
        routeLink: RouteConstant.profileScreenName,
        imageUrl: 'assets/images/icons/question.webp',
      ),
      body: BlocBuilder<MySavedQuestionsBloc, MySavedQuestionsState>(
        builder: (context, state) {
          if (state is MySavedQuestionsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MySavedQuestionsError) {
            return Center(
              child: Text('Error: ${state.failureData.message}'),
            );
          } else if (state is MySavedQuestionsLoaded) {
            return ListView.builder(
              key: const PageStorageKey<String>('my_saved_questions_list'),
              controller: _scrollController,
              itemCount: state.hasReachedMax ? state.questions.length : state.questions.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.questions.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    ),
                  );
                }
                return getQuestionCard(context, state.questions[index], index);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
