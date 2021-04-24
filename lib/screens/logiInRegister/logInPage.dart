import 'package:book_shop/screens/home_screen.dart';
import 'package:book_shop/screens/logiInRegister/signUpPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Widget _backButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           Text('Back',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: title,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0),
                    ),
                  ),
                  fillColor: Color(0xffcaffca),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff00bf00)),
      child: FlatButton(
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff00bf00)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xffe6b800),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Mobile number"),
        _entryField("Password", isPassword: true),
      ],
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
          image: AssetImage("assets/images/coverphoto/RegistrationPage.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _emailPasswordWidget(),
            SizedBox(height: 20),
            _submitButton(),
            Container(
              padding: EdgeInsets.only(right: 30, top: 10),
              alignment: Alignment.centerRight,
              child: Text('Forgot Password ?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff00bf00))),
            ),
            SizedBox(height: 50),
            _createAccountLabel(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
