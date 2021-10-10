import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/chittagongTodyDataModule.dart';
import 'package:toll_plaza/DatabaseModule/Chittagong/previousChittagongData.dart';
import 'package:toll_plaza/DesignModule/loading.dart';
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
  getData() async {
    try {
      await context.read<TodayReportChittagongDatabase>().getShortReport();
      await context.read<TodayReportChittagongDatabase>().getReport();
      await context.read<PreviousReportChittagongDatabase>().getPreviousReport();

       setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();//test
    /*Future.delayed(Duration(seconds: 1)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });*/
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return isLoading
        ? Container(
      color: Colors.white,
      child: Center(
        child:ColorLoader(),
      ),
    )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: providerThemeAndColor.backgroundColor,
              appBar: AppBar(
                actions: [],
                iconTheme: IconThemeData(color: providerThemeAndColor.iconColor),
                backgroundColor: providerThemeAndColor.mainColor,
                title: Text("Chittagong Report", style: TextStyle(color: providerThemeAndColor.textColor),
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
