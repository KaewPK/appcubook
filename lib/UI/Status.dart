import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Widget/Dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Status extends StatefulWidget {
  Status({Key key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<String> orderNo = [
    "CHU0000001",
    "CHU0000002",
    "CHU0000003",
    "CHU0000004",
    "CHU0000005",
    "CHU0000006",
  ];
  List<String> orderStatus = [
    "ยืนยันการเรียกลิงลม",
    "...กำลังเรียกลิงลม...",
    "ยืนยันการเรียกลิงลม",
    "...ลิงลมกำลังมา...",
    "ยืนยันการเรียกลิงลม",
    "...ลิงลมกำลังจัดส่ง...",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade200,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: orderNo.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.225,
            margin: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0.01,
              size.width * 0.03,
              size.height * 0.01,
            ),
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              0,
              size.width * 0.05,
              size.height * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gps_fixed,
                      size: size.height * 0.03,
                      color: ColorTheme.pink,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.05,
                        size.height * 0.01,
                        size.width * 0.05,
                        size.height * 0.01,
                      ),
                      width: size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ศูนย์หนังสือจุฬา",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: "Heavent",
                            ),
                          ),
                          Text(
                            "อาคารวิทยกิจจี่ ซอย จุฬาลงกรณ์  64",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: "Heavent",
                              color: Colors.black54,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.025),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.near_me,
                        size: size.height * 0.025,
                        color: ColorTheme.pink,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(size.width * 0.05, 0,
                            size.width * 0.05, size.height * 0.01),
                        child: Text(
                          "เดอะมอลล์งามวงศ์วาน ถนนงามวงศ์วาน".toUpperCase(),
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Heavent",
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "เลขออเดอร์ " + orderNo[index],
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: "Heavent",
                        color: ColorTheme.pink),
                  ),
                ),
                (orderStatus[index] == "ยืนยันการเรียกลิงลม")
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width * 0.8,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SendOrderDialog(
                                  title: "จัดส่งสินค้า",
                                  description:
                                      "คุณยืนยันที่จะเรียกลิงลมเข้ามารับของหรือไม่ ?",
                                  buttonText1: "ตกลง",
                                  buttonText2: "ยกเลิก",
                                ),
                              );
                            },
                            color: ColorTheme.pink,
                            child: Text(
                              orderStatus[index].toUpperCase(),
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Heavent",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.01),
                          child: Text(
                            orderStatus[index].toUpperCase(),
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontFamily: "Heavent",
                              color: ColorTheme.pink,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
