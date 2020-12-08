import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Deliver_Detail2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:location/location.dart';

class DeliverDetail1 extends StatefulWidget {
  final String orderNo;
  DeliverDetail1({Key key, @required this.orderNo}) : super(key: key);

  @override
  _DeliverDetail1State createState() => _DeliverDetail1State();
}

class _DeliverDetail1State extends State<DeliverDetail1> {
  final controller = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> myMarker = [];
  double currentlatitude, currentlongitude;
  List<String> items = [
    "โปรดเลือกสาขา",
    "Call Center",
    "สาขาย่อยคณะครุศาสตร์จุฬาฯ",
    "สาขาสยามสแควร์",
    "สาขาศาลาพระเกี้ยว",
    "สาขาจัตุรัสจามจุรี",
    "สาขาหัวหมาก",
    "สาขามหาวิทยาลัยนเรศวร",
    "สาขามหาวิทยาลัยพะเยา",
    "สาขามหาวิทยาลัยเทคโนโลยีสุรนารี",
    "สาขามทร.อีสาน",
    "สาขามหาวิทยาลัยบูรพา",
    "สาขาโรงเรียนนายร้อยพระจุลจอมเกล้า",
  ];
  List<LatLng> chuluLatLng = [
    LatLng(0.00, 0.00),
    LatLng(13.7436942, 100.5306789),
    LatLng(13.7377505, 100.5195678),
    LatLng(13.7436942, 100.5306789),
    LatLng(13.7354905, 100.5292909),
    LatLng(13.7327667, 100.5288403),
    LatLng(13.7512903, 100.6357278),
    LatLng(16.7455525, 100.1913481),
    LatLng(19.0265429, 99.8928883),
    LatLng(14.8763189, 102.0202544),
    LatLng(14.9875479, 102.1165542),
    LatLng(13.2792046, 100.9250741),
    LatLng(14.2918481, 101.1535016),
  ];
  LocationData currentLocation;
  BitmapDescriptor pinLocationIcon;
  int selectedItem = 0;
  String value;
  LatLng latLng;

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print("Error Permission denied");
      }
      return null;
    }
  }

  Future<bool> getlocation() async {
    currentLocation = await getCurrentLocation();
    currentlongitude = currentLocation.longitude;
    currentlatitude = currentLocation.latitude;
    print(currentlongitude);
    return true;
  }

  @override
  void dispose() {
    controller.dispose();
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
              color: Colors.grey.shade200,
              child: FutureBuilder<bool>(
                future: getlocation(),
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          height: size.height * 0.1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.gps_fixed,
                                size: size.height * 0.03,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  size.width * 0.05,
                                  size.height * 0.01,
                                  size.width * 0.02,
                                  size.height * 0.005,
                                ),
                                width: size.width * 0.85,
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
                                    Row(
                                      children: [
                                        Container(
                                          width: size.width * 0.65,
                                          height: size.height * 0.035,
                                          child: TextField(
                                            controller: controller,
                                            readOnly: true,
                                            cursorColor: ColorTheme.pink,
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "โปรดเลือกสาขา",
                                              hintStyle: TextStyle(
                                                fontSize: size.height * 0.018,
                                                fontFamily: "Heavent",
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.arrow_downward),
                                          iconSize: size.height * 0.025,
                                          onPressed: () => _buildItemPicker(),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.04,
                          color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                              bottom: size.height * 0.015,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.near_me,
                                  size: size.height * 0.03,
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DeliverDetail2(
                                          orderNo: widget.orderNo,
                                          latLng: latLng,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "ที่อยู่จัดส่งสินค้า".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: size.height * 0.02,
                                      fontFamily: "Heavent",
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          // padding: EdgeInsets.all(size.width * 0.02),
                          // height: size.height * 0.667,
                          // width: size.width * 1,
                          // alignment: Alignment.center,
                          child: GoogleMap(
                            myLocationEnabled: true,
                            zoomGesturesEnabled: true,
                            markers: {
                              rider1,
                              rider2,
                              rider3,
                              rider4,
                              rider5,
                              rider6
                            },
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(currentlatitude, currentlongitude),
                              zoom: 15,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                                backgroundColor: ColorTheme.pink),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Text(
                                "Loading GPS...",
                                style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  fontFamily: "Heavent",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemPicker() {
    String itemValue;
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        value = null;
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "ยกเลิก".toUpperCase(),
                      style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Heavent",
                        color: Colors.red,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: size.height * 0.03,
                    color: ColorTheme.pink,
                    onPressed: () {
                      setState(() {
                        value = itemValue;
                      });
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Container(
                height: size.height * 0.125,
                child: CupertinoPicker(
                  itemExtent: size.height * 0.045,
                  backgroundColor: CupertinoColors.white,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedItem = index;
                      controller.text = items[selectedItem];
                      latLng = chuluLatLng[index];
                    });
                  },
                  children: List<Widget>.generate(items.length, (index) {
                    return Center(
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontFamily: "Heavent",
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Marker rider1 = Marker(
    markerId: MarkerId('1'),
    position: LatLng(13.850227, 100.515754),
  );
  Marker rider2 = Marker(
    markerId: MarkerId('2'),
    position: LatLng(13.848445, 100.514876),
  );
  Marker rider3 = Marker(
    markerId: MarkerId('3'),
    position: LatLng(13.843907, 100.507476),
  );
  Marker rider4 = Marker(
    markerId: MarkerId('4'),
    position: LatLng(13.839554, 100.508570),
  );
  Marker rider5 = Marker(
    markerId: MarkerId('5'),
    position: LatLng(13.841950, 100.512110),
  );
  Marker rider6 = Marker(
    markerId: MarkerId('6'),
    position: LatLng(13.844054, 100.511810),
  );
}
