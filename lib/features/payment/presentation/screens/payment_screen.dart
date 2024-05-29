import 'package:flutter/material.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/subscription/presentation/widgets/webview_init_widget.dart';

class PaymentScreen extends StatefulWidget {
  final String redirectURL;
  const PaymentScreen({super.key, required this.redirectURL});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(text: 'Оплата', imageUrl: 'assets/images/icons/credit_card.png', routeLink: RouteConstant.subscriptionName,),
      body: FreedomPayInitialScreen(url: widget.redirectURL, successUrl: 'http://localhost:8000/api/pay/success', failureUrl: 'http://localhost:8000/api/pay/failure',),
    );
  }
}

