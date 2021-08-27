import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Chittagong/GraphChittagong.dart';
import 'package:toll_plaza/Pages/Chittagong/previousReportChittagong.dart';
import 'package:toll_plaza/Pages/Chittagong/todayReportChittagong.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ChittagongReportPage extends StatefulWidget {
  @override
  _ChittagongReportPageState createState() => _ChittagongReportPageState();
}

class _ChittagongReportPageState extends State<ChittagongReportPage> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return isLoading
        ? Container(
            color: providerThemeAndColor.backgroundColor,
            child: Center(
              child: Lottie.asset('assets/json/loading.json'),
            ),
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: providerThemeAndColor.backgroundColor,
              appBar: AppBar(
                actions: [],
                iconTheme:
                    IconThemeData(color: providerThemeAndColor.iconColor),
                backgroundColor: providerThemeAndColor.mainColor,
                title: Text(
                  "Chittagong Report",
                  style: TextStyle(color: providerThemeAndColor.textColor),
                ),
                bottom: TabBar(
                  labelStyle: TextStyle(color: providerThemeAndColor.textColor),
                  indicatorColor: providerThemeAndColor.textColor,
                  labelColor: providerThemeAndColor.textColor,
                  tabs: <Widget>[
                    Tab(text: "TODAY"),
                    Tab(text: "THIS WEEK"),
                    Tab(text: "GRAPH"),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  TodayReportChittagong(),
                  PreviousReportChittagong(),
                  GraphChittagong(),
                ],
              ),
            ),
          );
  }
}
