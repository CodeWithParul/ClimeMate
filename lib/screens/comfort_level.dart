import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather/current.dart';
import 'package:my_weather_app/util/custom_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  ComfortLevel({Key? key, required this.weatherDataCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
