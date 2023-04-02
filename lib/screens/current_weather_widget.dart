import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather/current.dart';
import 'package:my_weather_app/util/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeather({Key? key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        SizedBox(height: 15),
        currentWeatherMoreDetailWidget(),
      ],
      //temp area

      //wind speed
      //humidity
      //clouds
    );
  }

  Widget currentWeatherMoreDetailWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.current.windSpeed}km/h",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.current.clouds}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  "${weatherDataCurrent.current.humidity}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "${weatherDataCurrent.current.temp!.toInt()}°C",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 60,
              color: CustomColors.textColorBlack,
            ),
          ),
          TextSpan(
            text: "${weatherDataCurrent.current.weather![0].description}",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ])) //,
      ],
    );
  }
}
