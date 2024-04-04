import 'package:equatable/equatable.dart';

class ContextEntity extends Equatable{
  final int id;
  final int subjectId;
  final String context;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const ContextEntity({
   required this.id,required this.subjectId,required this.context, this.createdAt, this.updatedAt, this.deletedAt
});

  @override
  List<Object?> get props => [id,subjectId,context];



}