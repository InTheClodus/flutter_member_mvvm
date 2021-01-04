import 'package:flutter/material.dart';

import '../api.dart';
import '../view_state.dart';


class BaseModel extends ChangeNotifier {

  Api api;
  bool disposed = false;

  BaseModel({@required Api api}) : api = api;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}