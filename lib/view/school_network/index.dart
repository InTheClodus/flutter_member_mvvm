import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/view/base_view.dart';
import 'package:flutter_member_mvvm/viewmodels/login_model.dart';
import 'package:provider/provider.dart';

class IndexSchoolNetWork extends StatefulWidget {
  final AnimationController animationController;

  const IndexSchoolNetWork({Key key, this.animationController}) : super(key: key);
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexSchoolNetWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<LoginViewModel>(
        model: LoginViewModel(api: Provider.of(context)),
        onModelReady: (model){},
        builder: (context,model,child){
          return Container(
            child: Column(
              children: [
                Text(
                  "${model.index}"
                ),
                FlatButton(
                  child: Text("11111"),
                  onPressed: (){
                    model.ss();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}