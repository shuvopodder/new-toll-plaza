import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class SearchReportView extends StatefulWidget {
  final String vehicleName;
  final String totalVehicle;
  final String totalPayment;
  final String perVehicleRate;
  final String secondRowTitle;
  final String triadRowTitle;
  final String regular;
  final String ctrlR;
  final String date;
  final Widget child;

  SearchReportView(
      {Key key,
      @required this.vehicleName,
      this.totalVehicle,
      this.totalPayment,
      this.perVehicleRate,
      this.secondRowTitle,
      this.triadRowTitle,
      this.regular,
      this.ctrlR,
      this.date,
      this.child});
  @override
  _SearchReportViewState createState() => _SearchReportViewState();
}

class _SearchReportViewState extends State<SearchReportView> {
  double _height, _width;
  double _pixelRatio;
  bool large;
  bool medium;
  bool val = false;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: providerThemeAndColor.backgroundColor,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                flex: 2, child: Container(height: 80, child: widget.child)),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.vehicleName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: providerThemeAndColor.thirdTextColor,
                                fontSize: 18),
                          ),
                          flex: 3,
                        ),
                        widget.perVehicleRate == null
                            ? Container()
                            : Expanded(
                                child: Text(
                                  widget.perVehicleRate + " tk",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color:
                                          providerThemeAndColor.secondTextColor,
                                      fontSize: 14),
                                ),
                                flex: 1,
                              )
                      ],
                    ),
                    widget.secondRowTitle == null
                        ? Container()
                        : Container(
                            width: _width,
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  widget.secondRowTitle,
                                  style: TextStyle(
                                      color:
                                          providerThemeAndColor.secondTextColor,
                                      fontSize: 16),
                                )),
                                Expanded(
                                    child: Text(
                                  widget.totalVehicle != null
                                      ? widget.totalVehicle
                                      : widget.regular,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 16),
                                ))
                              ],
                            ),
                          ),
                    widget.triadRowTitle == null
                        ? Container()
                        : Container(
                            width: _width,
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  widget.triadRowTitle,
                                  style: TextStyle(
                                      color:
                                          providerThemeAndColor.secondTextColor,
                                      fontSize: 16),
                                )),
                                Expanded(
                                    child: Text(
                                  widget.totalPayment != null
                                      ? widget.totalPayment + " tk"
                                      : widget.ctrlR,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ))
                              ],
                            ),
                          ),
                    widget.triadRowTitle == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(right: 10, top: 5),
                            width: _width,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 15,
                                  color: Colors.green,
                                ),
                                Expanded(
                                  child: Text(widget.date),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
