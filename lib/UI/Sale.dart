import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/SaleDeail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datepicker_single/flutter_datepicker_single.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';

class Sale extends StatefulWidget {
  Sale({Key key}) : super(key: key);

  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  final day = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  final dropdownDay = TextEditingController();
  final dropdownMonth = TextEditingController();
  final dropdownYear = TextEditingController();

  DateTime selectedDay = DateTime.now();
  DateTime selectedmonth = DateTime.now();
  DateTime selectedYear = DateTime.now();
  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDay,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDay)
      setState(() {
        selectedDay = picked;
        dropdownDay.text = "${selectedDay.toLocal()}".split(' ')[0];
        day.text = "20000 บาท";
      });
  }

  Future<DateTime> selectDateWithDatePicker(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: selectedYear,
      initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(0),
      lastDate: DateTime(9999),
    );
  }

  @override
  void dispose() {
    day.dispose();
    month.dispose();
    year.dispose();
    dropdownDay.dispose();
    dropdownMonth.dispose();
    dropdownYear.dispose();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ยอดขายรายวัน",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: size.width * 0.325,
                                child:
                                    textfiled("เลือกวัน", dropdownDay, true)),
                            IconButton(
                              icon: Icon(Icons.event),
                              iconSize: size.height * 0.035,
                              onPressed: () => selectDate(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    textfiled("20450.00 บาท", day, false),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: size.height * 0.02,
                        margin: EdgeInsets.only(bottom: size.height * 0.02),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SaleDetail(
                                  name: "ยอดขายวัน",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "ตรวจสอบรายละเอียดการขาย >>".toUpperCase(),
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Heavent",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ยอดขายรายเดือน",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: size.width * 0.325,
                                child: textfiled(
                                    "เลือกเดือน", dropdownMonth, true)),
                            IconButton(
                              icon: Icon(Icons.event),
                              iconSize: size.height * 0.035,
                              onPressed: () {
                                showMonthPicker(
                                  context: context,
                                  firstDate:
                                      DateTime(DateTime.now().year - 1, 5),
                                  lastDate:
                                      DateTime(DateTime.now().year + 1, 9),
                                  initialDate: selectedmonth ?? DateTime.now(),
                                  //locale: Locale("en"),
                                ).then((date) {
                                  if (date != null) {
                                    setState(() {
                                      selectedmonth = date;
                                      dropdownMonth.text =
                                          selectedmonth?.month.toString() +
                                              "-" +
                                              selectedmonth?.year.toString();
                                      month.text = "50000 บาท";
                                    });
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    textfiled("20450.00 บาท", month, false),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: size.height * 0.02,
                        margin: EdgeInsets.only(bottom: size.height * 0.02),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SaleDetail(
                                  name: "ยอดขายเดือน",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "ตรวจสอบรายละเอียดการขาย >>".toUpperCase(),
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Heavent",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ยอดขายรายปี",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: size.width * 0.325,
                                child:
                                    textfiled("เลือกปี", dropdownYear, true)),
                            IconButton(
                              icon: Icon(Icons.event),
                              iconSize: size.height * 0.035,
                              onPressed: () async {
                                DateTime selected = await showYearPicker(
                                  context: context,
                                  initialDate: selectedYear,
                                );
                                if (selected != null) {
                                  setState(() {
                                    selectedYear = selected;
                                    dropdownYear.text =
                                        selected.year.toString();
                                    year.text = "80000 บาท";
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    textfiled("20450.00 บาท", year, false),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: size.height * 0.02,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SaleDetail(
                                  name: "ยอดขายปี",
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "ตรวจสอบรายละเอียดการขาย >>".toUpperCase(),
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Heavent",
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
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
