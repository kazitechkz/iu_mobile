import 'package:equatable/equatable.dart';

class GetBattleStatsEntity extends Equatable {
  final int total;
  final int victory;
  final int draft;
  final int defeat;

  const GetBattleStatsEntity(
      {required this.total,
      required this.victory,
      required this.draft,
      required this.defeat});

  @override
  List<Object?> get props => [total,victory,draft,defeat];
}
