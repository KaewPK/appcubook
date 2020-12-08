import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Deliver.dart';
import 'package:appcubook/UI/History.dart';
import 'package:appcubook/UI/Profile.dart';
import 'package:appcubook/UI/Status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  final Deliver deliver = Deliver();
  final Status status = Status();
  final History history = History();
  final Profile profile = Profile();

  Widget showPage = Deliver();
  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return deliver;
        break;
      case 1:
        return status;
        break;
      case 2:
        return history;
        break;
      case 3:
        return profile;
        break;
      default:
        return new Container(
          child: Center(
            child: Text(
              "No page found by page chooser.",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.03),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      size.width * 0.02,
                      size.height * 0.02,
                      size.width * 0.02,
                      size.height * 0.02),
                  child: Image.asset(
                    'assets/Logo.png',
                    fit: BoxFit.contain,
                    height: size.height * 0.05,
                  ),
                ),
              ),
            ),
            body: showPage ?? Container(),
            bottomNavigationBar: BottomNavigationBar(
              key: bottomNavigationKey,
              currentIndex: currentIndex,
              selectedItemColor: ColorTheme.pink,
              type: BottomNavigationBarType.fixed,
              iconSize: size.height * 0.03,
              onTap: (int tappedIndex) {
                setState(() {
                  currentIndex = tappedIndex;
                  showPage = pageChooser(tappedIndex);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.send),
                  title: Text(
                    "ส่งของ",
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: "Heavent"),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.place),
                  title: Text(
                    "สถานะ",
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: "Heavent"),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  title: Text(
                    "ประวัติ",
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: "Heavent"),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text(
                    "โปรไฟล์",
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: "Heavent"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
