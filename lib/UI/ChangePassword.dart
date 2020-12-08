import 'package:appcubook/Shared/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final pastpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();
  @override
  void dispose() {
    pastpassword.dispose();
    newpassword.dispose();
    confirmpassword.dispose();
    super.dispose();
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: size.width * 0.06,
                      color: ColorTheme.pink,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
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
                    Container(
                      width: size.width * 0.12,
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "เปลี่ยนรหัสผ่าน",
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Heavent",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textfiled("ระบุรหัสผ่านเก่า", pastpassword),
                    textfiled("ระบุรหัสผ่านใหม่", newpassword),
                    textfiled("ยีนยันรหัสผ่านใหม่", confirmpassword),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      width: size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () => Navigator.pop(context),
                        color: ColorTheme.pink,
                        child: Text(
                          "ยืนยันการเปลี่ยนรหัสผ่าน".toUpperCase(),
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Heavent",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textfiled(hintText, controller) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.01,
        right: size.width * 0.05,
      ),
      height: size.height * 0.065,
      child: TextField(
        controller: controller,
        cursorColor: ColorTheme.pink,
        style: TextStyle(
          fontSize: size.height * 0.018,
          fontFamily: "Heavent",
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintStyle: TextStyle(
            fontSize: size.height * 0.018,
            fontFamily: "Heavent",
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
