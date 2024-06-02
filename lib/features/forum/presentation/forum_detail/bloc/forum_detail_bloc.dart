import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/failure_data.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/discuss_entity.dart';
import '../../../domain/entities/get_forum_discuss_entity.dart';
import '../../../domain/entities/get_forum_entity.dart';
import '../../../domain/parameters/get_forum_discuss_parameter.dart';

part 'forum_detail_event.dart';
part 'forum_detail_state.dart';

class ForumDetailBloc extends Bloc<ForumDetailEvent, ForumDetailState> {
  ForumDetailBloc() : super(ForumDetailInitialState()) {}
}
