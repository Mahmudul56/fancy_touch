import 'package:fancy_touch/src/Screen/signup_screen.dart';
import 'package:fancy_touch/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';
import 'forgotpass.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  String user = '';

  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset("assets/user.png" ,)),
              Padding(
                padding: const EdgeInsets.only(right: 14, left: 10),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 25, color: Color(0xFF000000)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14, top: 22, left: 10),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 25, color: Color(0xFF000000)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgotpass()));
                        },
                        child: Text(
                          "Forgot Pass",
                          style: GoogleFonts.andada(
                              textStyle: TextStyle(
                                  fontSize: 18, color: Color(0xFF008CF8))),
                        ))),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF00FF9B),
                    borderRadius: BorderRadius.circular(22)),
                height: 60,
                width: 200,
                child: Center(
                    child: TextButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_LEFT,
                            msg: usernameController.text +
                                '\n' +
                                passController.text);
                      },
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (usernameController.text.isEmpty &&
                                  passController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: 'Please give a valid ID and Pass',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR,
                                    backgroundColor: Colors.amberAccent,
                                    textColor: Colors.pink);
                              } else if (usernameController.text == user &&
                                  passController.text == pass) {
                                Fluttertoast.showToast(
                                    msg: 'Login sucessful',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR,
                                    backgroundColor: Colors.amberAccent,
                                    textColor: Colors.pink);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(title: '',)));
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please give a valid ID and Pass',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.SNACKBAR,
                                    backgroundColor: Colors.amberAccent,
                                    textColor: Colors.pink);
                              }
                            },
                            child: Text('Sign In',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 20,
                                    )))),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Color(0xFF00FF9B),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupPage()));
                    }, child: Text('Sign-up',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20,
                        )))),
              ),
              Container(
                height: MediaQuery.of(context).size.height/13,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  color: Color(0xFF00FF9B),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp()));
                    }, child: Text('Homepage',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20,
                        )))),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}