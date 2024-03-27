import 'package:equatable/equatable.dart';

class WelcomeEntity extends Equatable{

  const WelcomeEntity({
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  const WelcomeEntity.first() : this(
    image: 'assets/images/student.webp',
    title: "Для школьников",
    description:"Для будущих абитуриентов - не парься и готовься легко и просто"
  );
  const WelcomeEntity.second() : this(
      image: 'assets/images/teacher_1.webp',
      title: "Для Учителей",
      description:"Для учителей - создавай свои классы и тестируй"
  );
  const WelcomeEntity.third() : this(
      image: 'assets/images/parents.webp',
      title: "Для Родителей",
      description:"Готовьте детей к ВУЗу и не ищите репетиторов"
  );

  @override
  List<Object?> get props => [image,title,description];

}