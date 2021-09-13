import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toll_plaza/Pages/homePage.dart';
import 'package:toll_plaza/Provider/firebaseDatabase.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  getData() async {
    FireDatabaseMethod databaseMethods = new FireDatabaseMethod();
    await FireDatabaseMethod().getUserInfo(userName).then((snapshot) {
      allowedData = snapshot.document.data["access"];
      print("$allowedData -----------------------------------------------");
    });
  }

  bool _passwordHide = true;
  var userName;
  var allowedData;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //user Email and password
  var password;

  //login error message
  // var loginErrorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/regnum.png", height: 150),
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("User Name"),
                            subtitle: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  userName = value;
                                });
                              },
                              key: Key('userName'),
                              decoration: InputDecoration(
                                  hintText: "regnumit@gmail.com"),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter Email";
                                } else if (!RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(value)) {
                                  return "Invalid Mail Address";
                                } else
                                  return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            leading: Icon(
                              Icons.email,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text("Password"),
                            subtitle: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              key: Key("password"),
                              obscureText: _passwordHide,
                              decoration: InputDecoration(
                                  hintText: "******",
                                  suffixIcon: IconButton(
                                    icon: _passwordHide
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.security),
                                    onPressed: () {
                                      setState(() {
                                        _passwordHide = !_passwordHide;
                                      });
                                    },
                                  )),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter Password";
                                }
                                return null;
                              },
                            ),
                            leading: Icon(
                              Icons.vpn_key,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              key: Key('submit'),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  logIn();
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  logIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userName.toString(), password: password.toString());
      getData();
      /*if (userCredential.user.displayName == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminDashboard()));
      } else if (userCredential.user.displayName != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }*/
      if (userCredential.user == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarMsg("User not found");
      } else if (e.code == 'wrong-password') {
        snackBarMsg("wrong password");
      } else {
        snackBarMsg("Something is wrong");
      }
    }
  }

  //SnackBar
  void snackBarMsg(loginErrorMessage) {
    //print("ok");
    final snackBar = SnackBar(
      content: Text(
        loginErrorMessage.toString(),
        style: TextStyle(color: Colors.red),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
