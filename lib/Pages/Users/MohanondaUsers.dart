import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class MohanondaUsers extends StatefulWidget {
  // const ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MohanondaUsers> {

  DatabaseReference ref;
  @override
  void initState() {

    checkData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providerThemeAndColor = Provider.of<ThemeAndColorProvider>(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(children: [
          SizedBox(height: 2,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: providerThemeAndColor.secondColor,
            child: Text("Mohanonda Users List",
              style: TextStyle(
                  color: providerThemeAndColor.secondTextColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Flexible(
                child: new FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: ref,
                    itemBuilder:(BuildContext context,
                        DataSnapshot snapshot,
                        Animation<double> animation, int index){
                      return new ListTile(
                        trailing: IconButton(icon: Icon(Icons.delete),iconSize: 40, onPressed: () =>
                            ref.child(snapshot.key.toString()).remove(),),
                        title: new Text(snapshot.value.toString(),
                          //    style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                      );
                    })),
          ),
        ],),
      ),
    );
  }

  Future<void> _onRefresh() async {

  }

  void checkData() async{
    final FirebaseDatabase database = FirebaseDatabase.instance;
    ref = database.reference().child('Mohanonda').child("Users");
  }

}
