import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_model_package/BranchLayer.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../api.dart';
import '../view_state.dart';
import 'package:flutter_member_mvvm/viewmodels/base_model.dart';
class HomeViewModel extends BaseModel {

  HomeViewModel({@required Api api}) : super(api: api);

  Future<ParseResponse> loadData() async {
    var query = BranchLayer().getAllBranchLayer();
    return await query.query();
  }

}