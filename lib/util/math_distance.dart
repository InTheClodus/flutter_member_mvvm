
import 'dart:math';
//// 计算两个经纬度的位置信息
class MathDistance{
  static getDistance(double lat1, double lng1, double lat2, double lng2) {
    /// 单位：米
    /// def ：地球半径
    double def = 6378137.0;
    double radLat1 = _rad(lat1);
    double radLat2 = _rad(lat2);
    double a = radLat1 - radLat2;
    double b = _rad(lng1) - _rad(lng2);
    double s = 2 *
        asin(sqrt(pow(sin(a / 2), 2) +
            cos(radLat1) * cos(radLat2) * pow(sin(b / 2), 2)));
    return (s * def).roundToDouble();
  }

  static double _rad(double d) {
    return d * pi / 180.0;
  }
}