import 'package:flutter/material.dart';
import 'package:my_wallet_app_ui/card_widget.dart';
import 'package:my_wallet_app_ui/expense_widget.dart';
import 'components/appbar.dart';
import 'config/colors.dart';
import 'config/size.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    // ignore: unused_local_variable
    var width = SizeConfig.getWidth(context);

    return Scaffold(
      body: Container(
        color: AppColors.primaryWhite,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height / 8,
                child: CustomAppBar(),
              ),
              Expanded(
                child: CardWidget(),
              ),
              Expanded(
                child: ExpensesWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
