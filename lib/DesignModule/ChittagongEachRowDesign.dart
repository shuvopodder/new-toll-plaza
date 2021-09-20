import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class ChittagongEachRowDesign extends StatefulWidget {
  final String firstColumnData;
  final String secondColumnData;
  final String thirdColumnData;
  final String fourthColumnData;
  final FontWeight fontWeight;
  final Color firstColumnFontColor;
  final Color secondColumnFontColor;
  final Color thirdColumnFontColor;
  final Color fourthColumnFontColor;
  final Color dividedColor;
  final Color backgroundColor;

  ChittagongEachRowDesign(
      {Key key,
      @required this.firstColumnData,
      @required this.secondColumnData,
      this.thirdColumnData,
      this.fourthColumnData, //test
      this.fontWeight,
      this.firstColumnFontColor,
      this.backgroundColor,
      this.secondColumnFontColor,
      this.thirdColumnFontColor,
      this.fourthColumnFontColor,
      this.dividedColor});
  @override
  _ChittagongEachRowDesignState createState() =>
      _ChittagongEachRowDesignState();
}

class _ChittagongEachRowDesignState extends State<ChittagongEachRowDesign> {
  String _firstColumnData;
  String _secondColumnData;
  String _thirdColumnData;
  String _fourthColumnData;
  FontWeight _fontWeight;
  Color _firstColumnFontColor;
  Color _secondColumnFontColor;
  Color _thirdColumnFontColor;
  Color _fourthColumnFontColor;
  Color _dividedColor;
  Color _backgroundColor;

  void setUp() {
    _firstColumnData = widget.firstColumnData;
    _secondColumnData = widget.secondColumnData;
    _thirdColumnData = widget.thirdColumnData;
    _fourthColumnData = widget.fourthColumnData; //test
    _fontWeight =
        widget.fontWeight != null ? widget.fontWeight : FontWeight.normal;
    _firstColumnFontColor = widget.firstColumnFontColor != null
        ? widget.firstColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
    _secondColumnFontColor = widget.secondColumnFontColor != null
        ? widget.secondColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
    _thirdColumnFontColor = widget.thirdColumnFontColor != null
        ? widget.thirdColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;
//test
    _fourthColumnFontColor = widget.fourthColumnFontColor != null
        ? widget.fourthColumnFontColor
        : context.read<ThemeAndColorProvider>().textColor;

    _dividedColor =
        widget.dividedColor != null ? widget.dividedColor : Colors.red;
    _backgroundColor = widget.backgroundColor != null
        ? widget.backgroundColor
        : context.read<ThemeAndColorProvider>().backgroundColor;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                _firstColumnData.toString(),
                style: TextStyle(
                    color: _firstColumnFontColor,
                    fontSize: 16,
                    fontWeight: _fontWeight),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "|",
                style: TextStyle(
                    color: _dividedColor,
                    fontSize: 16,
                    fontWeight: _fontWeight),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                _secondColumnData.toString(),
                style: TextStyle(
                    color: _secondColumnFontColor,
                    fontSize: 16,
                    fontWeight: _fontWeight),
                textAlign: TextAlign.center,
              ),
            ),
            _thirdColumnData == null
                ? Container()
                : Expanded(
                    flex: 1,
                    child: Text(
                      "|",
                      style: TextStyle(
                          color: _dividedColor,
                          fontSize: 16,
                          fontWeight: _fontWeight),
                      textAlign: TextAlign.center,
                    ),
                  ),
            _thirdColumnData == null
                ? Container()
                : Expanded(
                    flex: 2,
                    child: Text(
                      _thirdColumnData.toString(),
                      style: TextStyle(
                          color: _thirdColumnFontColor,
                          fontSize: 16,
                          fontWeight: _fontWeight),
                      textAlign: TextAlign.center,
                    ),
                  ),
            _fourthColumnData == null
                ? Container()
                : Expanded(
                    flex: 1,
                    child: Text(
                      "|",
                      style: TextStyle(
                          color: _dividedColor,
                          fontSize: 16,
                          fontWeight: _fontWeight),
                      textAlign: TextAlign.center,
                    ),
                  ),
            _fourthColumnData == null
                ? Container()
                : Expanded(
                    flex: 2,
                    child: Text(
                      _fourthColumnData.toString(),
                      style: TextStyle(
                          color: _fourthColumnFontColor,
                          fontSize: 16,
                          fontWeight: _fontWeight),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
