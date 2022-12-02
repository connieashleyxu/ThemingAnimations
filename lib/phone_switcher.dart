import 'package:flutter/material.dart';

class PhoneSwitcher extends StatefulWidget{
  // Constructor
  const PhoneSwitcher({Key? key}): super(key: key);

  @override
  State<PhoneSwitcher> createState() => _PhoneSwitcherState();
}

class _PhoneSwitcherState extends State<PhoneSwitcher> {
  // Instance Variables
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));
  String phoneImage = "https://digitalagencynetwork.com/wp-content/uploads/2018/10/apple-designed-lots-of-pop-art-logos-for-the-oct-30th-event.jpg";
  double phoneType = 1.0;
    double phoneWidth = 500;
    double phoneHeight = 400;
    double phoneScreenWidth = 350;
    double phoneScreenHeight = 300;
  Color speakerColor = Colors.black;
  Color phoneColor = Colors.black87;

  double buttonPadding = 0.0;

  // Phone type change to Android function
  void _phoneTypeChangeAndroid() {
    setState(() {
      phoneType = 1.3;
        phoneWidth = 500 * phoneType / 1.4;
        phoneHeight = 400 * phoneType / 1.7;
        phoneScreenWidth = 350 * (phoneType / 1.7);
        phoneScreenHeight = 300 * (phoneType / 1.5);
      phoneImage = "https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80";
      speakerColor = Colors.green;
      phoneColor = Colors.lightGreen;

      buttonPadding = 50.0;
    });
  }

  // Phone type change to IOS function
  void _phoneTypeChangeIOS() {
    setState(() {
      phoneType = 1.0;
        phoneWidth = 500;
        phoneHeight = 400;
        phoneScreenWidth = 350;
        phoneScreenHeight = 300;
      phoneImage = "https://digitalagencynetwork.com/wp-content/uploads/2018/10/apple-designed-lots-of-pop-art-logos-for-the-oct-30th-event.jpg";
      speakerColor = Colors.black;
      phoneColor = Colors.black87;

      buttonPadding = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            AnimatedContainer( // PHONE
              duration: const Duration(milliseconds: 1000),
              //margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              height: phoneWidth,
              width: phoneHeight,
              decoration: BoxDecoration(
                color: phoneColor,
                borderRadius: BorderRadius.circular(20 * (phoneType * 2.4)),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: <Widget>[
                  AnimatedContainer( // SPEAKER
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                    margin: const EdgeInsets.fromLTRB(0 , 30, 0, 30),
                    height: 20 * (phoneType * 1.5),
                    width: 70 * phoneType,
                    decoration: BoxDecoration(
                      color: speakerColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(
                    width: 1000,
                  ),
                  AnimatedContainer( // PHONE SCREEN
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                    child: Image(
                      // https://digitalagencynetwork.com/wp-content/uploads/2018/10/apple-designed-lots-of-pop-art-logos-for-the-oct-30th-event.jpg
                      // https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80
                      image: NetworkImage(phoneImage),
                      width: phoneScreenWidth,
                      height: phoneScreenHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 1000,
                  ),
                  AnimatedContainer( // HOME BUTTON
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    height: 60,
                    width: 60 * phoneType,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              child: Padding(
                padding: EdgeInsets.fromLTRB(160 - buttonPadding, 525, 0, 30),
                child: ElevatedButton( // ANDROID BUTTON
                  onPressed: _phoneTypeChangeAndroid,
                  child: const Text('Android'),
                ),
              ),
            ),
            const SizedBox(
              width: 350,
              height: 10,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              child: Padding(
                padding: EdgeInsets.fromLTRB(175 - buttonPadding, 570, 0, 30),
                child: ElevatedButton( // IOS BUTTON
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: _phoneTypeChangeIOS,
                  child: const Text('iOS'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}