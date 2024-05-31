import 'package:intl/intl.dart';
import 'package:iu/core/helpers/subject_helper.dart';

import '../../features/subscription/domain/entities/subscription_entity.dart';
import '../common/models/subject.dart';
import '../common/models/subscription.dart';

class SubscriptionHelper {
  static List<SubscriptionEntity> getSubscriptions() {
    return [
      const SubscriptionEntity(period: 1, price: '1590', isSelected: true, titleKk: '1 ай', titleRu: '1 мес'),
      const SubscriptionEntity(period: 3, price: '3990', isSelected: false, titleKk: '3 ай', titleRu: '3 мес'),
      const SubscriptionEntity(period: 6, price: '6990', isSelected: false, titleKk: '6 ай', titleRu: '6 мес'),
    ];
  }

  static List<SubscriptionEntity> getSubscriptionsByPeriod(int period) {
    return [
      SubscriptionEntity(period: 1, price: '1590', isSelected: period == 1, titleKk: '1 ай', titleRu: '1 мес'),
      SubscriptionEntity(period: 3, price: '3990', isSelected: period == 3, titleKk: '3 ай', titleRu: '3 мес'),
      SubscriptionEntity(period: 6, price: '6990', isSelected: period == 6, titleKk: '6 ай', titleRu: '6 мес'),
    ];
  }

  static FormattedSubscription getSubject(String tag, String endAt) {
    int subjectID = extractFirstDigit(tag);
    String formattedDate = formatDate(endAt);
    SingleLocalSubjectEntity subject = SubjectHelper.getSingleSubject(subjectID);
    return FormattedSubscription(title_kk: subject.titleKk, title_ru: subject.titleRu, endAt: formattedDate);
  }
}

int extractFirstDigit(String text) {
  // Используем регулярное выражение для поиска всех цифр в строке
  RegExp regExp = RegExp(r'\d+');
  // Ищем совпадения
  Iterable<Match> matches = regExp.allMatches(text);
  // Если совпадения найдены, возвращаем первую цифру, иначе возвращаем -1
  if (matches.isNotEmpty) {
    return int.parse(matches.first.group(0)!);
  } else {
    return -1; // Или любое другое значение по умолчанию
  }
}

String formatDate(String isoDate) {
  // Парсинг даты из строки в объект DateTime
  DateTime dateTime = DateTime.parse(isoDate);
  // Форматирование даты в нужный формат
  DateFormat dateFormat = DateFormat('dd.MM.yyyy');
  return dateFormat.format(dateTime);
}