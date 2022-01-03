import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';
class Forgotpass extends StatefulWidget {

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController rePassController = TextEditingController();

  getsharepref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      user_name = pref.getString('user_name') ?? '';
    });
  }

  String user_name = '';
  @override
  void initState() {
    // TODO: implement initState
    getsharepref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Tyep your user name',
                  border: OutlineInputBorder( borderSide: BorderSide(
                      width: 25,color: Color(0xff000000,)
                  )),
                    )),
              ),
            TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 25,color: Color(0xff000000,)
                    )
                  ),
                )),
            TextField(
                controller: rePassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder( borderSide: BorderSide(
                      width: 25,color: Color(0xff000000,)
                  )),
                )),

            TextButton(onPressed: () {
              if(user_name==usernameController.text){
                if(passController.text==rePassController.text){
                  setShaPref();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                }else{
                  Fluttertoast.showToast(
                      msg: "Please enter a valid pass",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.cyan,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                }
              }else{
                Fluttertoast.showToast(
                    msg: "Please enter a valid name",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.cyan,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
            }, child: Text("submit"))
          ],
        ),
      ),
    );
  }
  setShaPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("user_name", usernameController.text);
  }
}

