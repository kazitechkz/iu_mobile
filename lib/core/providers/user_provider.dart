import 'package:flutter/cupertino.dart';
import 'package:iu/features/auth/data/models/auth_user_model.dart';

class UserProvider extends ChangeNotifier {
  AuthUserModel? _user;

  AuthUserModel? get user => _user;

  void InitUser(AuthUserModel? user) {
    if (user != _user) {
      this._user = user;
    }
  }

  set user(AuthUserModel? user) {
    if (user != _user) {
      this._user = user;
      notifyListeners();
    }
  }
}
