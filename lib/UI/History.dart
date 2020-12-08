import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Widget/Dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade200,
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.08,
            margin: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0.01,
              size.width * 0.03,
              size.height * 0.01,
            ),
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              size.height * 0.015,
              size.width * 0.05,
              size.height * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สำเร็จ",
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Heavent",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "หมายเลขออเดอร์ : ",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                        Text(
                          "CHU0000112",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => OrderDialog(
                        title: "รายการหนังสือ",
                        description:
                            "หนังสือ...xxxx...xxxx \n หนังสือ...xxxx...xxxx \n หนังสือ...xxxx...xxxx",
                        buttonText: "ตกลง",
                      ),
                    );
                  },
                  color: ColorTheme.pink,
                  child: Text(
                    "ตรวจสอบรายการสินค้า".toUpperCase(),
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: "Heavent",
                      color: Colors.white,
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
