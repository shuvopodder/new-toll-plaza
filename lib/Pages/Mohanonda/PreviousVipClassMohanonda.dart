import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/DesignModule/sevenDaysVipRowDesign.dart';
import 'package:toll_plaza/Provider/getData.dart';
import 'package:toll_plaza/Provider/getMohanondaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousVipClassMohanonda extends StatefulWidget {
  @override
  _PreviousVipClassMohanondaState createState() => _PreviousVipClassMohanondaState();
}

class _PreviousVipClassMohanondaState extends State<PreviousVipClassMohanonda> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    var fetch_data = Provider.of<GetMohanondaData>(context, listen: false);
    fetch_data.get_sevenDaysVipPass();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Consumer<GetMohanondaData>(builder: (content, data, child) {
      return data.sevenDaysVipPass != null
          ? AnimatedList(
        key: _listKey,
        initialItemCount: data.sevenDaysVipPass.data.length,
        itemBuilder: (BuildContext context, int index,
            Animation<double> animation) {
          index = index - 1;
          return index == -1
              ? FadeIn(
            //for animation
            duration: Duration(milliseconds: 1000),
            //fow showing each value of list
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: providerThemeAndColor.secondColor,
                child: Text(
                  "Seven Days VIP Pass Data",
                  style: TextStyle(
                      color: providerThemeAndColor.secondTextColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
              : SlideInUp(
            //for animation
            duration: Duration(milliseconds: 500),
            //fow showing each value of list
            child: sevenDaysVipRowDesign(
              date: data.sevenDaysVipPass.data[index].date.toString(),
              total_amount: data
                  .sevenDaysVipPass.data[index].total_amount
                  .toString(),
              rickshawvan: data
                  .sevenDaysVipPass.data[index].rickshawvan
                  .toString(),
              motorcycle: data.sevenDaysVipPass.data[index].motorcycle
                  .toString(),
              threefourwheeler: data
                  .sevenDaysVipPass.data[index].threefourwheeler
                  .toString(),
              sedancar: data.sevenDaysVipPass.data[index].sedancar
                  .toString(),
              four_wheeler: data
                  .sevenDaysVipPass.data[index].four_wheeler
                  .toString(),
              microbus: data.sevenDaysVipPass.data[index].microbus
                  .toString(),
              minibus:
              data.sevenDaysVipPass.data[index].minibus.toString(),
              agrouse:
              data.sevenDaysVipPass.data[index].agrouse.toString(),
              minitruck: data.sevenDaysVipPass.data[index].minitruck
                  .toString(),
              bigbus:
              data.sevenDaysVipPass.data[index].bigbus.toString(),
              medium_truck: data
                  .sevenDaysVipPass.data[index].medium_truck
                  .toString(),
              heavy_truck: data
                  .sevenDaysVipPass.data[index].heavy_truck
                  .toString(),
              trailer_long: data
                  .sevenDaysVipPass.data[index].trailer_long
                  .toString(),
              firstColumnFontColor:
              providerThemeAndColor.secondTextColor,
              secondColumnFontColor:
              providerThemeAndColor.thirdTextColor,
              thirdColumnFontColor: Colors.black,
              fontWeight: FontWeight.bold,
              backgroundColor:
              providerThemeAndColor.backgroundColor,
            ),
          );
        },
      )
          : Container();
    });
  }
}