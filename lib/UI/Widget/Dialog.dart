import 'package:appcubook/Shared/Color.dart';
import 'package:flutter/material.dart';

class OrderDialog extends StatelessWidget {
  final String title, description, buttonText;

  OrderDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        bottom: size.height * 0.02,
        left: size.width * 0.02,
        right: size.width * 0.02,
      ),
      margin: EdgeInsets.only(top: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.02),
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.03,
                fontFamily: "Heavent",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.025),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontFamily: "Heavent",
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.005),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width * 0.6,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () => Navigator.of(context).pop(),
                  color: ColorTheme.pink,
                  child: Text(
                    buttonText.toUpperCase(),
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: "Heavent",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SendOrderDialog extends StatelessWidget {
  final String title, description, buttonText1, buttonText2;

  SendOrderDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText1,
    @required this.buttonText2,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        bottom: size.height * 0.02,
        left: size.width * 0.02,
        right: size.width * 0.02,
      ),
      margin: EdgeInsets.only(top: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.02),
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.03,
                fontFamily: "Heavent",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.025),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontFamily: "Heavent",
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.325,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.green)),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.green,
                    child: Text(
                      buttonText1.toUpperCase(),
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Heavent",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.325,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.red,
                    child: Text(
                      buttonText2.toUpperCase(),
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
      ),
    );
  }
}
