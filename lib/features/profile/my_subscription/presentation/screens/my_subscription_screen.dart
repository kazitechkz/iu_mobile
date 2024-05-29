import 'package:flutter/material.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';

class MySubscriptionScreen extends StatefulWidget {
  const MySubscriptionScreen({super.key});

  @override
  State<MySubscriptionScreen> createState() => _MySubscriptionScreenState();
}

class _MySubscriptionScreenState extends State<MySubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBarWidget(text: 'Мои подписки', imageUrl: 'assets/images/icons/subscriptions.webp', routeLink: RouteConstant.profileScreenName),
      body: Center(child: Text('SUBS')),
    );
  }
}
