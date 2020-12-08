import 'package:appcubook/Shared/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class SetProfile extends StatefulWidget {
  SetProfile({Key key}) : super(key: key);

  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  final name = TextEditingController();
  final address = TextEditingController();
  final opentime = TextEditingController();
  final closetime = TextEditingController();

  TimeOfDay open = TimeOfDay.now();
  TimeOfDay close = TimeOfDay.now();

  void onTimeOpenChanged(TimeOfDay newTime) {
    setState(() {
      open = newTime;
    });
  }

  void onTimeCloseChanged(TimeOfDay newTime) {
    setState(() {
      close = newTime;
    });
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    opentime.dispose();
    closetime.dispose();
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
                      "โปรไฟล์",
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Heavent",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textfiled("ชื่อโปรไฟล์", name, false),
                    textfiled("ที่อยู่", address, false),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Text(
                        "เวลาเปิด-ปิดร้าน",
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontFamily: "Heavent",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: size.width * 0.25,
                            child: textfiled("เปิดร้าน", opentime, true)),
                        IconButton(
                          icon: Icon(Icons.event),
                          iconSize: size.height * 0.035,
                          onPressed: () {
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: open,
                                onChange: onTimeOpenChanged,
                                onChangeDateTime: (DateTime dateTime) {
                                  print(dateTime);
                                },
                              ),
                            );
                          },
                        ),
                        Container(
                            width: size.width * 0.25,
                            child: textfiled("ปิดร้าน", closetime, true)),
                        IconButton(
                          icon: Icon(Icons.event),
                          iconSize: size.height * 0.035,
                          onPressed: () {
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: open,
                                onChange: onTimeOpenChanged,
                                onChangeDateTime: (DateTime dateTime) {
                                  print(dateTime);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.08),
                      width: size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () => Navigator.pop(context),
                        color: ColorTheme.pink,
                        child: Text(
                          "บันทึกข้อมูล".toUpperCase(),
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

  Widget textfiled(hintText, controller, readOnly) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      height: size.height * 0.065,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
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
