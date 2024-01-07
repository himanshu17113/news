import 'package:flutter/cupertino.dart';

extension DeviceSize on BuildContext {
  double deviceHeight() => MediaQuery.of(this).size.height;

  double deviceWidth() => MediaQuery.of(this).size.width;
}

const String apikey = "2d2118c3873e4f06b8ebe3d02ab35cf2";
