import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/test.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';


// Service
class RemoteService {
  Future<ParseResponse> login(String userName, String password,BuildContext context) async {
    ParseResponse response;
    try{
      response = await ParseUser.loginWith("ad", {"id": userName, "password": password});
      if(response.success){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>TestPage()));
      }
    }catch(e){}
    return response;
  }
}