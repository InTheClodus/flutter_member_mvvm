import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/viewmodels/home_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../view_state.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) async {
        var rep =await model.loadData();
        print(rep.results);
      },
      model: HomeViewModel(api: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: _buildBody(context, model),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel model) {
    return Container(
        child: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child:FutureBuilder<ParseResponse>(
                  future: model.loadData(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                     var rep = snapshot.data as ParseResponse;
                      return SingleChildScrollView(
                        child: Column(
                          children: rep.results.map((e) => Text(e.get("objectId"))).toList(),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ));
  }
}
