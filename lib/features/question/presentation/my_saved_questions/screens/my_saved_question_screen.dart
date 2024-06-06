import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/question/domain/parameters/get_my_saved_questions_parameter.dart';
import 'package:iu/features/question/presentation/my_saved_questions/bloc/my_saved_questions_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../../../../../core/services/injection_main.container.dart';
import '../../../../attempt/domain/entities/question_entity.dart';
import '../widgets/saved_question_widget.dart';

class MySavedQuestionScreen extends StatefulWidget {
  const MySavedQuestionScreen({super.key});

  @override
  State<MySavedQuestionScreen> createState() => _MySavedQuestionScreenState();
}

class _MySavedQuestionScreenState extends State<MySavedQuestionScreen> {
  static const _pageSize = 5;
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
    if (_isBottom && !_isLoading) {
      context.read<MySavedQuestionsBloc>().add(GetMySavedQuestionsEvent(params.copyWith(page: context.read<MySavedQuestionsBloc>().currentPage)));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isLoading {
    return context.read<MySavedQuestionsBloc>().state is MySavedQuestionsLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: 'Мои вопросы',
        routeLink: RouteConstant.profileScreenName,
        imageUrl: 'assets/images/icons/question.webp',
      ),
      body: BlocBuilder<MySavedQuestionsBloc, MySavedQuestionsState>(
        builder: (context, state) {
          if (state is MySavedQuestionsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MySavedQuestionsLoaded) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_isLoading) {
                  context.read<MySavedQuestionsBloc>().add(GetMySavedQuestionsEvent(params.copyWith(page: context.read<MySavedQuestionsBloc>().currentPage)));
                }
                return false;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.questions.data.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= state.questions.data.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return getQuestionCard(context, state.questions.data[index], index);
                },
              ),
            );
          } else if (state is MySavedQuestionsError) {
            return Center(
              child: Text('Error: ${state.failureData.message}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
