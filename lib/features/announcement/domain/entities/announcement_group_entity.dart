import 'package:equatable/equatable.dart';

class AnnouncementGroupEntity extends Equatable{
  final int id;
  final String titleRu;
  final String titleKk;
  final String? titleEn;
  final bool isActive;
  final int thumbnail;
  final String startDate;
  final String endDate;
  final int order;
  final String? createdAt;
  final String? updatedAt;
  final int? announcementsCount;
  
  const AnnouncementGroupEntity({
    required this.id,
    required this.titleRu,
    required this.titleKk,
    this.titleEn,
    required this.isActive,
    required this.thumbnail,
    required this.startDate,
    required this.endDate,
    required this.order,
    this.createdAt,
    this.updatedAt,
    this.announcementsCount
});



  @override
  List<Object?> get props => [id,titleRu,titleKk,isActive,thumbnail,startDate,endDate,order];
}