import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class SubscriptionEntity extends Equatable {
  final int id;
  final String tag;
  final String name;
  final String description;
  final bool isActive;
  final int price;
  final int signupFee;
  final String currency;
  final int trialPeriod;
  final String trialInterval;
  final String trialMode;
  final int gracePeriod;
  final String graceInterval;
  final int invoicePeriod;
  final String invoiceInterval;
  final int tier;
  final String createdAt;
  final String startsAt;
  final String endsAt;

  @override
  List<Object> get props =>
      [
        id,
        tag,
        name,
        description,
        isActive,
        price,
        signupFee,
        currency,
        trialPeriod,
        trialInterval,
        trialMode,
        gracePeriod,
        graceInterval,
        invoicePeriod,
        invoiceInterval,
        tier,
        createdAt,
        startsAt,
        endsAt,
      ];

  const SubscriptionEntity(
      {required this.id, required this.tag, required this.name, required this.description, required this.isActive, required this.price, required this.signupFee, required this.currency, required this.trialPeriod, required this.trialInterval, required this.trialMode, required this.gracePeriod, required this.graceInterval, required this.invoicePeriod, required this.invoiceInterval, required this.tier, required this.createdAt, required this.startsAt, required this.endsAt});
}

class SubscriptionModel extends SubscriptionEntity {
  const SubscriptionModel({required super.id, required super.tag, required super.name, required super.description, required super.isActive, required super.price, required super.signupFee, required super.currency, required super.trialPeriod, required super.trialInterval, required super.trialMode, required super.gracePeriod, required super.graceInterval, required super.invoicePeriod, required super.invoiceInterval, required super.tier, required super.createdAt, required super.startsAt, required super.endsAt});
  
  factory SubscriptionModel.fromJson(DataMap map) {
    return SubscriptionModel(
        id: map['id'] as int,
        tag: map['tag'] as String,
        name: map['name'] as String,
        description: map['description'] as String,
        isActive: map['is_active'] as bool,
        price: map['price'] as int,
        signupFee: map['signup_fee'] as int,
        currency: map['currency'] as String,
        trialPeriod: map['trial_period'] as int,
        trialInterval: map['trial_interval'] as String,
        trialMode: map['trial_mode'] as String,
        gracePeriod: map['grace_period'] as int,
        graceInterval: map['grace_interval'] as String,
        invoicePeriod: map['invoice_period'] as int,
        invoiceInterval: map['invoice_interval'] as String,
        tier: map['tier'] as int,
        createdAt: map['created_at'] as String,
        startsAt: map['starts_at'] as String,
        endsAt: map['ends_at'] as String
    );
  }

  static List<SubscriptionModel> fromMapList(List<DataMap> mapList) {
    return mapList.map((map) => SubscriptionModel.fromJson(map)).toList();
  }
}