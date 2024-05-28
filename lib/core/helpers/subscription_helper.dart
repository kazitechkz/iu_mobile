import '../../features/subscription/domain/entities/subscription_entity.dart';

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
}