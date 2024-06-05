import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_constants/route_constant.dart';

class MainServiceEntity extends Equatable {
  final String image;
  final String name;
  final String routeName;

  const MainServiceEntity(
      {required this.image, required this.name, required this.routeName});

  static List<List<MainServiceEntity>> getServices() {
    return [
      [
        const MainServiceEntity(
          image: "assets/images/icons/profile.webp",
          name: 'Профиль',
          routeName: RouteConstant.dashboardScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/subscription.webp",
          name: 'Подписки',
          routeName: RouteConstant.subscriptionName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/rating.webp",
          name: 'Рейтинг',
          routeName: RouteConstant.dashboardScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/education.webp",
          name: 'Обучение',
          routeName: RouteConstant.stepsScreenName,
        ),
      ],
      [
        const MainServiceEntity(
          image: "assets/images/icons/training.webp",
          name: 'ЕНТ Тренажер',
          routeName: RouteConstant.untModeScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/stat.webp",
          name: 'Статистика',
          routeName: RouteConstant.statMainName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/question.webp",
          name: 'Мои вопросы',
          routeName: RouteConstant.untModeScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/classroom.webp",
          name: 'Мои классы',
          routeName: RouteConstant.untModeScreenName,
        ),
      ],
      [
        const MainServiceEntity(
          image: "assets/images/icons/tasks.webp",
          name: 'Мои задания',
          routeName: RouteConstant.myAttemptsSettingsScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/tournament.webp",
          name: 'Турниры',
          routeName: RouteConstant.listTournamentName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/battle.webp",
          name: 'Онлайн Баттл',
          routeName: RouteConstant.untModeScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/wallet.webp",
          name: 'Баланс',
          routeName: RouteConstant.untModeScreenName,
        ),
      ],
      [
        const MainServiceEntity(
          image: "assets/images/icons/career.webp",
          name: 'Профориентация',
          routeName: RouteConstant.careerQuizzesListName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/iutube.webp",
          name: 'IUTube',
          routeName: RouteConstant.iutubeMainName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/message.webp",
          name: 'Сообщения',
          routeName: RouteConstant.notificationListScreenName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/news.webp",
          name: 'Новости',
          routeName: RouteConstant.newsListName,
        ),
      ],
      [
        const MainServiceEntity(
          image: "assets/images/icons/forum.webp",
          name: 'Форум',
          routeName: RouteConstant.forumListName,
        ),
        const MainServiceEntity(
          image: "assets/images/icons/techsupport.webp",
          name: 'Служба поддержки',
          routeName: RouteConstant.techSupportListName,
        ),
      ]
    ];
  }

  @override
  List<Object?> get props => [image, name, routeName];
}
