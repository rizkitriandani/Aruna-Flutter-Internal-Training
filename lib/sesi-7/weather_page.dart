import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sesi_3/sesi-7/geolocator.dart';
import 'package:flutter_sesi_3/sesi-7/weather_data.dart';
import 'package:intl/intl.dart';

import '../sesi-6/api_service.dart';
import 'colors.dart';
import 'fonts.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  ApiService apiService = ApiService();
  bool isLoading = true;
  WeatherData weatherData = WeatherData();

  @override
  void initState() {
    //add postframe callback
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //get current position
      var position = await determinePosition();
      var longitude = position.longitude;
      var latitude = position.latitude;
      print("longitude: $longitude");
      print("latitude: $latitude");
      var rawWeatherData = await apiService.fetchWeatherData(
          latitude: latitude, longitude: longitude);
      weatherData = WeatherData.fromJson(json.decode(rawWeatherData.body));
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: yellow,
        elevation: 0,
        title: Text(weatherData.name ?? "-", style: primaryTextStyle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: black,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const ShapeDecoration(
                            color: black, shape: StadiumBorder()),
                        child: Text(
                            DateFormat('EEEE, d MMMM y').format(DateTime.now()),
                            style: primaryTextStyle.copyWith(
                                color: white, fontSize: 12))),
                    const SizedBox(height: 20),
                    Text(
                      weatherData.weather?[0].main ?? "-",
                      style: primaryTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${weatherData.main?.temp?.round()}° C",
                      style: primaryTextStyle.copyWith(fontSize: 70),
                    ),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Feels like ${weatherData.main?.feelsLike?.round()}° C",
                            style: primaryTextStyle.copyWith(fontSize: 24))),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(weatherData.weather?[0].description ?? "-",
                          style: primaryTextStyle.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WeatherVariable(
                            iconData: Icons.water,
                            label: 'Wind',
                            value: "${weatherData.wind?.speed} m/s",
                          ),
                          const SizedBox(width: 20),
                          WeatherVariable(
                            iconData: Icons.water_drop_outlined,
                            label: 'Humidity',
                            value: "${weatherData.main?.humidity}%",
                          ),
                          const SizedBox(width: 20),
                          WeatherVariable(
                            iconData: Icons.visibility_outlined,
                            label: 'Visibility',
                            value: "${weatherData.visibility} m",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class WeatherVariable extends StatelessWidget {
  const WeatherVariable({
    Key? key,
    required this.iconData,
    this.value,
    required this.label,
  }) : super(key: key);

  final IconData iconData;
  final String? value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: yellow, size: 20),
        const SizedBox(width: 10),
        Text(value ?? '-',
            style: primaryTextStyle.copyWith(color: yellow, fontSize: 12)),
        Text(label,
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w300, color: yellow, fontSize: 8)),
      ],
    );
  }
}
