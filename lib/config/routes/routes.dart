import 'package:flutter/material.dart';

class AppRoutes {

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
