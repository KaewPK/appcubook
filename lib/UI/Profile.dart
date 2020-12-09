import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/ChangePassword.dart';
import 'package:appcubook/UI/SetProfile.dart';
import 'package:appcubook/UI/ShowPrice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade200,
      child: Container(
        margin: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: size.width * 0.12,
                  backgroundColor: ColorTheme.pink,
                  child: CircleAvatar(
                    radius: size.width * 0.11,
                    backgroundImage: AssetImage('assets/bastilledan.png'),
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Chulabook",
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontFamily: "Heavent",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "แก้ไขรูปโปรไฟล์",
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontFamily: "Heavent",
                          color: ColorTheme.pink,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SetProfile(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.08,
                margin: EdgeInsets.only(top: size.height * 0.03),
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
                          "โปรไฟล์",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "เปลี่ยนแปลงข้อมูลร้าน",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward,
                        size: size.width * 0.08, color: ColorTheme.pink),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChangePassword(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.08,
                margin: EdgeInsets.only(top: size.height * 0.01),
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
                          "รหัสผ่าน",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "แก้ไข เปลี่ยนรหัสผ่าน",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward,
                        size: size.width * 0.08, color: ColorTheme.pink),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ShowPrice(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.08,
                margin: EdgeInsets.only(top: size.height * 0.01),
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
                          "รายละเอียดรายได้",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "การส่งพัสดุ",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward,
                        size: size.width * 0.08, color: ColorTheme.pink),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: size.height * 0.08,
                margin: EdgeInsets.only(top: size.height * 0.01),
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
                          "ติดต่อ- สอบถาม",
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Heavent",
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "สอบถามปัญหา",
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Heavent",
                            color: ColorTheme.pink,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward,
                        size: size.width * 0.08, color: ColorTheme.pink),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
