
import 'package:iu/core/common/models/subject.dart';

import '../services/image_service.dart';

class SubjectHelper {
  static List<LocalSubjectEntity> getSubjects() {
    return [
      LocalSubjectEntity(4, 'Математика', 'Математика', getSubjectIconPath(4), false, 1),
      LocalSubjectEntity(5, 'Физика', 'Физика', getSubjectIconPath(5), false, 1),
      LocalSubjectEntity(6, 'Химия', 'Химия', getSubjectIconPath(6), false, 1),
      LocalSubjectEntity(7, 'Биология', 'Биология', getSubjectIconPath(7), false, 1),
      LocalSubjectEntity(8, 'География', 'География', getSubjectIconPath(8), false, 1),
      LocalSubjectEntity(9, 'Дүниежүзі тарихы', 'Всемирная история', getSubjectIconPath(9), false, 1),
      LocalSubjectEntity(10, 'Құқық негіздері', 'Основы права', getSubjectIconPath(10), false, 1),
      LocalSubjectEntity(11, 'Ағылшын тілі', 'Английский язык', getSubjectIconPath(11), false, 1),
      LocalSubjectEntity(12, 'Қазақ тілі', 'Казахский язык', getSubjectIconPath(12), false, 1),
      LocalSubjectEntity(13, 'Қазақ әдебиеті', 'Казахская литература', getSubjectIconPath(13), false, 1),
      LocalSubjectEntity(14, 'Орыс тілі', 'Русский язык', getSubjectIconPath(14), false, 1),
      // LocalSubjectEntity(15, 'Орыс әдебиеті', 'Русская литература', getSubjectIconPath(15), false, 1),
      LocalSubjectEntity(16, 'Информатика', 'Информатика', getSubjectIconPath(15), false, 1),
    ];
  }

  static List<LocalSubjectEntity> getSelectedSubjects(int id, int period) {
    return [
      LocalSubjectEntity(4, 'Математика', 'Математика', getSubjectIconPath(4), id == 4, period),
      LocalSubjectEntity(5, 'Физика', 'Физика', getSubjectIconPath(5), id == 5, period),
      LocalSubjectEntity(6, 'Химия', 'Химия', getSubjectIconPath(6), id == 6, period),
      LocalSubjectEntity(7, 'Биология', 'Биология', getSubjectIconPath(7), id == 7, period),
      LocalSubjectEntity(8, 'География', 'География', getSubjectIconPath(8), id == 8, period),
      LocalSubjectEntity(9, 'Дүниежүзі тарихы', 'Всемирная история', getSubjectIconPath(9), id == 9, period),
      LocalSubjectEntity(10, 'Құқық негіздері', 'Основы права', getSubjectIconPath(10), id == 10, period),
      LocalSubjectEntity(11, 'Ағылшын тілі', 'Английский язык', getSubjectIconPath(11), id == 11, period),
      LocalSubjectEntity(12, 'Қазақ тілі', 'Казахский язык', getSubjectIconPath(12), id == 12, period),
      LocalSubjectEntity(13, 'Қазақ әдебиеті', 'Казахская литература', getSubjectIconPath(13), id == 13, period),
      LocalSubjectEntity(14, 'Орыс тілі', 'Русский язык', getSubjectIconPath(14), id == 14, period),
      // LocalSubjectEntity(15, 'Орыс әдебиеті', 'Русская литература', getSubjectIconPath(15), id == 15, period),
      LocalSubjectEntity(16, 'Информатика', 'Информатика', getSubjectIconPath(15), id == 15, period),
    ];
  }

  static SingleLocalSubjectEntity getSingleSubject(int id) {
    SingleLocalSubjectEntity subject = const SingleLocalSubjectEntity(titleKk: '', titleRu: '');
    switch (id) {
      case 1:
        subject = const SingleLocalSubjectEntity(titleKk: 'Математикалық сауаттылық', titleRu: 'Математическая грамотность');
        break;
      case 2:
        subject = const SingleLocalSubjectEntity(titleKk: 'Қазақстан тарихы', titleRu: 'История Казахстана');
        break;
      case 3:
        subject = const SingleLocalSubjectEntity(titleKk: 'Оқу сауаттылығы', titleRu: 'Грамотность чтения');
        break;
      case 4:
        subject = const SingleLocalSubjectEntity(titleKk: 'Математика', titleRu: 'Математика');
        break;
      case 5:
        subject = const SingleLocalSubjectEntity(titleKk: 'Физика', titleRu: 'Физика');
        break;
      case 6:
        subject = const SingleLocalSubjectEntity(titleKk: 'Химия', titleRu: 'Химия');
        break;
      case 7:
        subject = const SingleLocalSubjectEntity(titleKk: 'Биология', titleRu: 'Биология');
        break;
      case 8:
        subject = const SingleLocalSubjectEntity(titleKk: 'География', titleRu: 'География');
        break;
      case 9:
        subject = const SingleLocalSubjectEntity(titleKk: 'Дүниежүзі тарихы', titleRu: 'Всемирная история');
        break;
      case 10:
        subject = const SingleLocalSubjectEntity(titleKk: 'Құқық негіздері', titleRu: 'Основы права');
        break;
      case 11:
        subject = const SingleLocalSubjectEntity(titleKk: 'Ағылшын тілі', titleRu: 'Английский язык');
        break;
      case 12:
        subject = const SingleLocalSubjectEntity(titleKk: 'Қазақ тілі', titleRu: 'Казахский язык');
        break;
      case 13:
        subject = const SingleLocalSubjectEntity(titleKk: 'Қазақ әдебиеті', titleRu: 'Казахская литература');
        break;
      case 14:
        subject = const SingleLocalSubjectEntity(titleKk: 'Орыс тілі', titleRu: 'Русский язык');
        break;
      case 15:
        subject = const SingleLocalSubjectEntity(titleKk: 'Орыс әдебиеті', titleRu: 'Русская литература');
        break;
      case 16:
        subject = const SingleLocalSubjectEntity(titleKk: 'Информатика', titleRu: 'Информатика');
        break;
      default:
        subject = const SingleLocalSubjectEntity(titleKk: '', titleRu: '');
        break;
    }
    return subject;
  }
}