import 'package:http/http.dart' as http;
import 'dart:convert'; //jsonDecode를 사용할 수 있음

class Network {
  final String url;
  final String url2;
  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    //날씨 데이터 타입은 다양하기 때문에 dynamic
    //json parshing
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;

      //jsonDecode의 타입은 dynamic type이므로 값을 변수에 담으려면 var을 사용해야한다.
      var parshingData = jsonDecode(jsonData);
      return parshingData;
    }
  }

  Future<dynamic> getAirData() async {
    //날씨 데이터 타입은 다양하기 때문에 dynamic
    //json parshing
    final response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;

      //jsonDecode의 타입은 dynamic type이므로 값을 변수에 담으려면 var을 사용해야한다.
      var parshingData = jsonDecode(jsonData);
      return parshingData;
    }
  }
}
