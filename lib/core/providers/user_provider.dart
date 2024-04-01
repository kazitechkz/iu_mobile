import 'package:flutter/cupertino.dart';
import 'package:iu/core/adapters/auth_user_adapter.dart';
import 'package:iu/features/auth/data/models/auth_user_model.dart';

class UserProvider extends ChangeNotifier {
  AuthUserHive? _user;

  AuthUserHive? get user => _user;

  void InitUser(AuthUserHive? user) {
    if (user != _user) {
      this._user = user;
    }
  }

  set user(AuthUserHive? user) {
    if (user != _user) {
      this._user = user;
      notifyListeners();
    }
  }

  void clearUser() {
    _user = null;
    // Очистка других данных пользователя
    notifyListeners();
  }
}
