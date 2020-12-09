import 'package:appcubook/Shared/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowPrice extends StatefulWidget {
  ShowPrice({Key key}) : super(key: key);

  @override
  _ShowPriceState createState() => _ShowPriceState();
}

class _ShowPriceState extends State<ShowPrice> {
  List<String> value1 = [
    "ค่าบริการ (ระยะทาง)",
    "0-2",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
  ];
  List<String> value2 = [
    "ราคาค่าบริการลิงลม",
    "45",
    "45",
    "45",
    "45",
    "45",
    "60",
    "60",
    "60",
    "60",
    "80",
    "80",
    "110",
    "110",
    "110",
    "110",
  ];
  List<String> value3 = [
    "ใช้เวลาจัดส่ง",
    "40",
    "40",
    "40",
    "40",
    "40",
    "60",
    "60",
    "60",
    "60",
    "90",
    "90",
    "120",
    "120",
    "120",
    "120",
  ];
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
                  top: size.height * 0.02,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "รายละเอียดรายได้ การส่งพัสดุ โดยเริ่มต้น จากสำนักงานศูนย์หนังสือสาขาสยาม",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontFamily: "Heavent",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        " * เกิน 15.1 กม.ขึ้นไปคิดกม.ล่ะ 15 บาท",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "Heavent",
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        itemCount: value1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: size.height * 0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    (value1[index] == "ค่าบริการ (ระยะทาง)")
                                        ? Text(
                                            value1[index],
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          )
                                        : Text(
                                            value1[index] + " กม.",
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          ),
                                    (value2[index] == "ราคาค่าบริการลิงลม")
                                        ? Text(
                                            value2[index],
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          )
                                        : Text(
                                            value2[index] + " บาท",
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          ),
                                    (value3[index] == "ใช้เวลาจัดส่ง")
                                        ? Text(
                                            value3[index],
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          )
                                        : Text(
                                            value3[index] + " นาที",
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black,
                                            ),
                                          )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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
