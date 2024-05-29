import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/my_location.dart';
import 'package:flutter_application_1/data/network.dart';
import 'package:flutter_application_1/screens/weather_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

const apikey = '9a882db6a1591f35fd544a33542ce127';

//info.plist, pubspec.yaml, menifest

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double? latitude3;
  late double? longitude3;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    ///ocationPermission permission = await Geolocator.requestPermission();
    MyLocation myLocation = MyLocation();
    //await는 Future의 값이 return될 때까지 기다려야 한다는 의미이다.
    //위도와 경도 값이 포지션 변수에 할당 될 때까지 기다리기 위해서 await를 사용한다.
    await myLocation.getMyCurrentLocation(); //getMyCurrentLocation메소드를 기다림
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        //'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');
    var weatherData =
        await network.getJsonData(); //parshing 데이터를 return해주고 있기 때문에 await
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    //weather_screen 페이지로 이동 시 weatherData, airData에 담긴 데이터들이 동시에 전달된다.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(
            parseWeatherData: weatherData,
            parseAirPollution: airData,
          );
        },
      ),
    );
  }

  // Future<void> fetchData() async {

  //     var myJson = parshingData['weather'][0]['description'];
  //     print(myJson);

  //     var wind = parshingData['wind']['speed'];
  //     print(wind);

  //     var id = parshingData['id'];
  //     print(id);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotatePulse,
          colors: [Colors.amber],
          strokeWidth: 10.0,
          pathBackgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
