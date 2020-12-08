import 'dart:async';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:appcubook/Shared/Color.dart';
import 'package:appcubook/UI/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DeliverDetail2 extends StatefulWidget {
  final String orderNo;
  final LatLng latLng;
  DeliverDetail2({Key key, @required this.orderNo, this.latLng})
      : super(key: key);

  @override
  _DeliverDetail2State createState() => _DeliverDetail2State();
}

class _DeliverDetail2State extends State<DeliverDetail2> {
  final address = TextEditingController();
  final orderNo = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  int selectedItem = 0;
  List<String> items = ["0", "1 - 5", "6 - 10", "11 - 15", "16 - 20"];
  String value;
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> myMarker = [];
  double currentlatitude, currentlongitude;
  LocationData currentLocation;

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
    return true;
  }

  handletap(LatLng tappedPoint) {
    setState(() {
      currentlatitude = tappedPoint.latitude;
      currentlongitude = tappedPoint.longitude;
      getAddressFromLatLng(currentlatitude, currentlongitude);
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
      ));
    });
  }

  getAddressFromLatLng(lat, long) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(lat, long,
          localeIdentifier: "th");
      Placemark place = p[0];
      setState(() {
        address.text =
            "${place.thoroughfare}, ${place.subThoroughfare}${place.locality} ${place.subLocality} ${place.administrativeArea} ${place.postalCode} ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    (widget.orderNo == null)
        ? orderNo.text = null
        : orderNo.text = widget.orderNo;
    super.initState();
  }

  @override
  void dispose() {
    address.dispose();
    orderNo.dispose();
    name.dispose();
    phone.dispose();
    super.dispose();
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
                      itemValue = items[selectedItem];
                    });
                  },
                  children: List<Widget>.generate(items.length, (index) {
                    return Center(
                      child: Text(
                        items[index] + "  กก.",
                        style: TextStyle(fontSize: size.height * 0.025),
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

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(
      Marker(
        markerId: MarkerId("fromPoint"),
        position: widget.latLng,
        infoWindow: InfoWindow(title: "ศูนย์หนังสือจุฬา"),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId("toPoint"),
        position: LatLng(currentlatitude, currentlongitude),
        infoWindow: InfoWindow(title: "ตำแหน่งฉัน"),
      ),
    );
    return tmp;
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
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.015),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: size.width * 0.06,
                        color: ColorTheme.pink,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          size.width * 0.02,
                          size.height * 0.02,
                          size.width * 0.02,
                          size.height * 0.0225),
                      child: Text(
                        "รับที่...เดอะมอลล์งามวงศ์วาน",
                        style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontFamily: "Heavent",
                        ),
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
                          height: size.height * 0.35,
                          width: size.width * 1,
                          alignment: Alignment.center,
                          child: GoogleMap(
                            myLocationEnabled: true,
                            zoomGesturesEnabled: true,
                            onTap: handletap,
                            markers: _createMarkers(),
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: widget.latLng,
                              zoom: 10.75,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Container(
                                height: size.height * 0.425,
                                color: Colors.white,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                    size.width * 0.05,
                                    size.height * 0.01,
                                    size.width * 0.02,
                                    size.height * 0.01,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.near_me,
                                            size: size.height * 0.035,
                                            color: ColorTheme.pink,
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                size.width * 0.05,
                                                0,
                                                size.width * 0.02,
                                                size.height * 0.01),
                                            width: size.width * 0.85,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ที่อยู่จัดส่งสินค้า",
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.0225,
                                                    fontFamily: "Heavent",
                                                  ),
                                                ),
                                                Text(
                                                  "เดอะมอลล์งามวงศ์วาน ถนนงามวงศ์วาน อำเภอเมืองนนทบุรี นนทบุรี 11000",
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.018,
                                                      fontFamily: "Heavent",
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      textfiled(
                                          "รายละเอียดสถานที่ตั้ง (เช่น จุดสังเกตุ ชั้น หมายเลขที่อยู่)",
                                          address),
                                      textfiled(
                                          "เลขออเดอร์ CH0000101", orderNo),
                                      textfiled("ชื่อ - นามสกุล ผู้รับ", name),
                                      textfiled("หมายเลขโทรศัพท์", phone),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.02),
                                color: Colors.white,
                                height: size.height * 0.05,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      size.width * 0.05,
                                      size.height * 0.01,
                                      size.width * 0.02,
                                      size.height * 0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "น้ำหนักพัสดุ",
                                        style: TextStyle(
                                          fontSize: size.height * 0.0225,
                                          fontFamily: "Heavent",
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          (value == null)
                                              ? Container()
                                              : Text(
                                                  value + " กก.",
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.0225,
                                                    fontFamily: "Heavent",
                                                  ),
                                                ),
                                          FlatButton(
                                            onPressed: () {
                                              _buildItemPicker();
                                            },
                                            child: Text(
                                              "เลือก".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: size.height * 0.02,
                                                fontFamily: "Heavent",
                                                color: ColorTheme.pink,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.02),
                                color: Colors.white,
                                height: size.height * 0.15,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      size.width * 0.05,
                                      size.height * 0.01,
                                      size.width * 0.05,
                                      size.height * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "รายละเอียดพัสดุ",
                                        style: TextStyle(
                                          fontSize: size.height * 0.0225,
                                          fontFamily: "Heavent",
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "หมายเลขสินค้า... ",
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            widget.orderNo,
                                            style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: "Heavent",
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: 3,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Text(
                                              "หนังสือ...xxxx...xxxx",
                                              style: TextStyle(
                                                fontSize: size.height * 0.018,
                                                fontFamily: "Heavent",
                                                color: Colors.black54,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                  size.width * 0.05,
                                  size.height * 0.01,
                                  size.width * 0.02,
                                  size.height * 0.01,
                                ),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.red)),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  color: ColorTheme.pink,
                                  child: Text(
                                    "เพิ่มที่อยู่".toUpperCase(),
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
