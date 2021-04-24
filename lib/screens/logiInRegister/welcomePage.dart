import 'package:book_shop/screens/logiInRegister/logInPage.dart';
import 'package:book_shop/screens/logiInRegister/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_shop/controllers/controller.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Controller controller = Get.put(Controller());
  Widget _signInButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Color(0xff00bf00)),
        child: Text(
          controller.btnNameLogin.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Color(0xff00bf00),
        ),
        child: Text(
          controller.btnNameSignUp.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/coverphoto/LoginPage.jpg"),
            fit: BoxFit.cover,
          )),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _signInButton(),
                SizedBox(
                  height: 20,
                ),
                _signUpButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            );
          })),
    );
  }
}
