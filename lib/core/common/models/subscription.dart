import 'package:equatable/equatable.dart';

import '../../utils/typedef.dart';

class PlanEntity extends Equatable {
  final int id;
  final String tag;
  final String name;
  final String description;
  final int price;
  final String currency;
  final int trialPeriod;
  final String trialInterval;
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
        price,
        currency,
        trialPeriod,
        trialInterval,
        gracePeriod,
        graceInterval,
        invoicePeriod,
        invoiceInterval,
        tier,
        createdAt,
        startsAt,
        endsAt,
      ];

  const PlanEntity(
      {required this.id, required this.tag, required this.name, required this.description, required this.price, required this.currency, required this.trialPeriod, required this.trialInterval, required this.gracePeriod, required this.graceInterval, required this.invoicePeriod, required this.invoiceInterval, required this.tier, required this.createdAt, required this.startsAt, required this.endsAt});
}

class PlanModel extends PlanEntity {
  const PlanModel(
      {required super.id, required super.tag, required super.name, required super.description, required super.price, required super.currency, required super.trialPeriod, required super.trialInterval, required super.gracePeriod, required super.graceInterval, required super.invoicePeriod, required super.invoiceInterval, required super.tier, required super.createdAt, required super.startsAt, required super.endsAt});

  factory PlanModel.fromJson(DataMap map) {
    return PlanModel(
        id: map['id'] as int,
        tag: map['tag'] as String,
        name: map['name'] as String,
        description: map['description'] as String,
        price: map['price'] as int,
        currency: map['currency'] as String,
        trialPeriod: map['trial_period'] as int,
        trialInterval: map['trial_interval'] as String,
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
}

class FormattedSubscription extends Equatable {
  final String title_kk;
  final String title_ru;
  final String endAt;

  const FormattedSubscription({required this.title_kk, required this.title_ru, required this.endAt});

  @override
  List<Object> get props => [title_kk, title_ru, endAt];
}