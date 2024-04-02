import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/core/providers/user_provider.dart';

import '../../../core/common/widgets/bottom_nav_bar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Главная страница"),
      ),
      body: Center(
        child: Text("Dashboard ${context.read<UserProvider>().user?.name}"),
      ),
    );
  }
}
