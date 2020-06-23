import 'package:flutter/material.dart';
import 'package:schedule_app/screens/app_explanation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppExplanation(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 300,
              height: 30,
              color: Colors.green,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your username'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 30,
              color: Colors.green,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter your username'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.yellow,
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.yellow,
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
