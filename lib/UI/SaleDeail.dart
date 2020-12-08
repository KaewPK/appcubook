import 'package:appcubook/Shared/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SaleDetail extends StatefulWidget {
  final String name;
  SaleDetail({Key key, @required this.name}) : super(key: key);

  @override
  _SaleDetailState createState() => _SaleDetailState();
}

class _SaleDetailState extends State<SaleDetail> {
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
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "วันที่ xx/xx/xxxx",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: size.height * 0.06,
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
                                      Text(
                                        "หนังสือ....",
                                        style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontFamily: "Heavent",
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "20450.00 บาท",
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
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
