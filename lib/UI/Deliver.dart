import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Deliver_Detail1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Deliver extends StatefulWidget {
  Deliver({Key key}) : super(key: key);

  @override
  _DeliverState createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  List<String> orderNo = [
    "CHU0000001",
    "CHU0000002",
    "CHU0000003",
    "CHU0000004",
    "CHU0000005",
    "CHU0000006"
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
                      "สินค้ารอจัดส่ง",
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Heavent",
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "เลขออเดอร์ ",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                        Text(
                          orderNo[index],
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => DeliverDetail1(
                          orderNo: orderNo[index],
                        ),
                      ),
                    );
                  },
                  color: ColorTheme.pink,
                  child: Text(
                    "เตรียมการจัดส่ง".toUpperCase(),
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
