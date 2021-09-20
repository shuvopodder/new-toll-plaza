import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Pages/Mohanonda/previousReportMohanonda.dart';
import 'package:toll_plaza/Pages/Mohanonda/sevenDaysDataMohanonda.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousReportMohanonda2 extends StatefulWidget {
  @override
  _PreviousReportMohanonda2State createState() =>
      _PreviousReportMohanonda2State();
}

class _PreviousReportMohanonda2State extends State<PreviousReportMohanonda2> {
  bool _todayButtonSelected;
  bool _previousButtonSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todayButtonSelected = true;
    _previousButtonSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _todayButtonSelected = true;
                  _previousButtonSelected = false;
                });
              },
              child: Text("Total"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _todayButtonSelected
                  ? providerThemeAndColor.mainColor
                  : providerThemeAndColor.secondColor,
              animationDuration: Duration(milliseconds: 500),
            ),
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _todayButtonSelected = false;
                  _previousButtonSelected = true;
                });
              },
              child: Text("Vehicle Class"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              elevation: 10,
              textColor: providerThemeAndColor.textColor,
              color: _previousButtonSelected
                  ? providerThemeAndColor.mainColor
                  : providerThemeAndColor.secondColor,
              animationDuration: Duration(milliseconds: 500),
            ),
          ],
        ),
        Expanded(
          child: _todayButtonSelected
              ? PreviousReportMohanonda()
              : sevenDaysDataMohanonda(),
        )
      ],
    );
  }
}
