import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_constants/route_constant.dart';

class MainServiceEntity extends Equatable {
  final IconData icon;
  final String name;
  final String routeName;

  const MainServiceEntity(
      {required this.icon, required this.name, required this.routeName});

  static List<MainServiceEntity> getServices() {
    return [
      const MainServiceEntity(
        icon: FontAwesomeIcons.house,
        name: 'Профиль',
        routeName: RouteConstant.dashboardScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.handshake,
        name: 'Подписки',
        routeName: RouteConstant.dashboardScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.star,
        name: 'Рейтинг',
        routeName: RouteConstant.dashboardScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.book,
        name: 'Обучение',
        routeName: RouteConstant.stepsScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.dumbbell,
        name: 'ЕНТ Тренажер',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.percent,
        name: 'Статистика',
        routeName: RouteConstant.statMainName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.circleQuestion,
        name: 'Мои вопросы',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.userGroup,
        name: 'Мои классы',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.listCheck,
        name: 'Мои задания',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.trophy,
        name: 'Турниры',
        routeName: RouteConstant.listTournamentName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.chess,
        name: 'Онлайн Баттл',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.wallet,
        name: 'Баланс',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.suitcase,
        name: 'Профориентация',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.play,
        name: 'IUTube',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.message,
        name: 'Сообщения',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.newspaper,
        name: 'Новости',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.comment,
        name: 'Форум',
        routeName: RouteConstant.untModeScreenName,
      ),
      const MainServiceEntity(
        icon: FontAwesomeIcons.headset,
        name: 'Служба поддержки',
        routeName: RouteConstant.untModeScreenName,
      ),
    ];
  }

  @override
  List<Object?> get props => [icon, name, routeName];
}
