import 'package:geolocator/geolocator.dart'; //날씨 앱

class MyLocation {
  late double latitude2 = 0.0;
  late double longitude2 = 0.0;

  Future<void> getMyCurrentLocation() async {
    //await가 있으면 async가 있어야 함
    try {
      //Geolocator 패키지를 사용해서 위도와 경도 값을 position 변수에 전달하게 된다.
      //이를 위해서 await를 사용해서 async 방식으로 메소드가 동작하게 된다.
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print('There was a problem with the internet connection.');
    }
  }
}
