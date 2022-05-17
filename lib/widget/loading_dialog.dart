import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

LoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Stack(
              children: [
                Blur(
                  blur: 2.5,
                  blurColor: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.1225,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.1225,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulseSync,
                      colors: [Colors.blue],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
