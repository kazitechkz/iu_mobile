import 'package:equatable/equatable.dart';

class SubscriptionEntity extends Equatable {
  final int period;
  final String price;
  final String titleKk;
  final String titleRu;
  final bool isSelected;
  const SubscriptionEntity({required this.period, required this.price, required this.titleKk, required this.titleRu, required this.isSelected});

  @override
  // TODO: implement props
  List<Object?> get props => [period, price, titleKk, titleRu, isSelected];
}