import 'package:flutter/material.dart';
import 'package:my_weather_app/util/custom_colors.dart';
import '../controller/global_controller.dart';
import 'package:get/get.dart';
import '../widgets/header_widget.dart';
import 'comfort_level.dart';
import 'current_weather_widget.dart';
import 'daily_data_widget.dart';
import 'hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      const HeaderWidget(),
                      CurrentWeather(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(height: 30),
                      HourlyDataWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather(),
                      ),
                      const SizedBox(height: 10),
                      globalController.getData().getDailyWeather() == null
                          ? const SizedBox()
                          : DailyDataForecast(
                              weatherDataDaily:
                                  globalController.getData().getDailyWeather(),
                            ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(height: 10),
                      ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
