
import 'package:iu/core/common/models/subject.dart';

import '../services/image_service.dart';

class SubjectHelper {
  static List<LocalSubjectEntity> getSubjects() {
    return [
      LocalSubjectEntity(4, 'Математика', 'Математика', getSubjectIconPath(4), false),
      LocalSubjectEntity(5, 'Физика', 'Физика', getSubjectIconPath(5), false),
      LocalSubjectEntity(6, 'Химия', 'Химия', getSubjectIconPath(6), false),
      LocalSubjectEntity(7, 'Биология', 'Биология', getSubjectIconPath(7), false),
      LocalSubjectEntity(8, 'География', 'География', getSubjectIconPath(8), false),
      LocalSubjectEntity(9, 'Дүниежүзі тарихы', 'Всемирная история', getSubjectIconPath(9), false),
      LocalSubjectEntity(10, 'Құқық негіздері', 'Основы прав', getSubjectIconPath(10), false),
      LocalSubjectEntity(11, 'Ағылшын тілі', 'Английский язык', getSubjectIconPath(11), false),
      LocalSubjectEntity(12, 'Қазақ тілі', 'Казахский язык', getSubjectIconPath(12), false),
      LocalSubjectEntity(13, 'Қазақ әдебиеті', 'Казахская литература', getSubjectIconPath(13), false),
      LocalSubjectEntity(14, 'Орыс тілі', 'Русский язык', getSubjectIconPath(14), false),
      LocalSubjectEntity(15, 'Информатика', 'Информатика', getSubjectIconPath(15), false),
    ];
  }

  static List<LocalSubjectEntity> getSelectedSubjects(int id) {
    return [
      LocalSubjectEntity(4, 'Математика', 'Математика', getSubjectIconPath(4), id == 4),
      LocalSubjectEntity(5, 'Физика', 'Физика', getSubjectIconPath(5), id == 5),
      LocalSubjectEntity(6, 'Химия', 'Химия', getSubjectIconPath(6), id == 6),
      LocalSubjectEntity(7, 'Биология', 'Биология', getSubjectIconPath(7), id == 7),
      LocalSubjectEntity(8, 'География', 'География', getSubjectIconPath(8), id == 8),
      LocalSubjectEntity(9, 'Дүниежүзі тарихы', 'Всемирная история', getSubjectIconPath(9), id == 9),
      LocalSubjectEntity(10, 'Құқық негіздері', 'Основы прав', getSubjectIconPath(10), id == 10),
      LocalSubjectEntity(11, 'Ағылшын тілі', 'Английский язык', getSubjectIconPath(11), id == 11),
      LocalSubjectEntity(12, 'Қазақ тілі', 'Казахский язык', getSubjectIconPath(12), id == 12),
      LocalSubjectEntity(13, 'Қазақ әдебиеті', 'Казахская литература', getSubjectIconPath(13), id == 13),
      LocalSubjectEntity(14, 'Орыс тілі', 'Русский язык', getSubjectIconPath(14), id == 14),
      LocalSubjectEntity(15, 'Информатика', 'Информатика', getSubjectIconPath(15), id == 15),
    ];
  }
}