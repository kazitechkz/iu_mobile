import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iu/core/helpers/subject_helper.dart';
import 'package:iu/core/helpers/subscription_helper.dart';

import '../../../../core/common/models/failure_data.dart';
import '../../../../core/common/models/subject.dart';
import '../../domain/entities/subscription_entity.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitial()) {
    on<GetSubscriptionsEvent>(_handleGetSubscriptions);
    on<SelectSubscriptionEvent>(_handleSelectSubscription);
  }

  Future<void> _handleGetSubscriptions(GetSubscriptionsEvent event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoading());
    emit(SubscriptionLoaded(SubscriptionHelper.getSubscriptions()));
  }

  Future<void> _handleSelectSubscription(SelectSubscriptionEvent event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoading());
    emit(SubscriptionLoaded(SubscriptionHelper.getSubscriptionsByPeriod(event.period)));
  }
}

