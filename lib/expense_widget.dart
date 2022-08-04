import 'package:flutter/material.dart';
import 'package:my_wallet_app_ui/components/arrow_button.dart';
import 'package:my_wallet_app_ui/piechart/piechart.dart';
import 'config/colors.dart';
import 'config/size.dart';
import 'config/strings.dart';

class ExpensesWidget extends StatefulWidget {
  @override
  _ExpensesWidgetState createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: height / 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: width / 20),
                  child: Text(
                    "Monthly Expenses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize(20)),
                  )),
              Container(
                width: width / 3.5,
                margin: EdgeInsets.only(right: width / 30),
                child: Row(
                  children: <Widget>[
                    ArrowButton(
                      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: fontSize(17),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: width / 50)),
                    ArrowButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: fontSize(17),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: category.map((data) {
                      return Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: AppColors
                                      .pieColors[category.indexOf(data)],
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                data['name'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: fontSize(16),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: PieChart(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
