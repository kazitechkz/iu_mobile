import 'package:equatable/equatable.dart';
import 'package:iu/core/mixins/title_mixin.dart';

class SubscriptionEntity extends Equatable with TitleMixin {
  final int period;
  final String price;
  final String titleKk;
  final String titleRu;
  final bool isSelected;
  const SubscriptionEntity({required this.period, required this.price, required this.titleKk, required this.titleRu, required this.isSelected});

  @override
  // TODO: implement props
  List<Object?> get props => [period, price, titleKk, titleRu, isSelected];

  @override
  String? getTitleKk() => titleKk;

  @override
  String? getTitleRu() => titleRu;
}