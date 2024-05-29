import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {
  //메소드의 타입이 Widget인 이유는 각 날씨의 상태를 수치화해서 그 수치에 맞는 이미지 파일을 불러와야 하기 때문이다.
  Widget? getWeatherIcon(int conditon) {
    if (conditon < 300) {
      return SvgPicture.asset(
        'svg/Cloud-Lightning.svg',
        color: Colors.black87,
      );
    } else if (conditon < 600) {
      return SvgPicture.asset(
        'svg/Cloud-Snow-Alt.svg',
        color: Colors.black87,
      );
    } else if (conditon == 800) {
      return SvgPicture.asset(
        'svg/Sun.svg',
        color: Colors.black87,
      );
    } else if (conditon <= 804) {
      return SvgPicture.asset(
        'svg/Cloud-Sun.svg',
        color: Colors.black87,
      );
    }
    return null;
  }

  Widget? getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        'image/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 5) {
      return Image.asset(
        'image/bad.png',
        width: 37.0,
        height: 35.0,
      );
    }
    return null;
  }

  Widget? getAirCondition(int index) {
    if (index == 1) {
      return Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 2) {
      return Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 3) {
      return Text(
        '"보통"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 4) {
      return Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 5) {
      return Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return null;
  }
}
