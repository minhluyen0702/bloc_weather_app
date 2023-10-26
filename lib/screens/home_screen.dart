import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather/weather.dart';

import '../bloc/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-2.5, -0.3),
                child: getBackgroundBot(
                  int.parse(
                    DateFormat('HH').format(
                      DateTime.now(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.5, -0.3),
                child: getBackgroundBot(
                  int.parse(
                    DateFormat('HH').format(
                      DateTime.now(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: getBackgroundTop(
                  int.parse(
                    DateFormat('HH').format(
                      DateTime.now(),
                    ),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${state.weather.areaName}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          getWish(int.parse(
                              DateFormat('HH').format(DateTime.now()))),
                          Center(
                            child: getWeatherIcon(
                                state.weather.weatherConditionCode!),
                          ),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 55,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${state.weather.weatherMain}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd -')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp.Max',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp.Min',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset('assets/1.png');
    case >= 300 && 400:
      return Image.asset('assets/2.png');
    case >= 500 && 600:
      return Image.asset('assets/3.png');
    case >= 600 && 700:
      return Image.asset('assets/4.png');
    case >= 700 && 800:
      return Image.asset('assets/5.png');
    case 800:
      return Image.asset('assets/6.png');
    case 801:
      return Image.asset('assets/7.png');
    case 802:
      return Image.asset('assets/8.png');
    default:
      return Image.asset('assets/9.png');
  }
}

Widget getWish(int time) {
  switch (time) {
    case >= 5 && < 12:
      return const Text(
        'GOOD MORNING!',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
    case >= 12 && < 16:
      return const Text(
        'GOOD AFTERNOON!',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
    case >= 16 && < 21:
      return const Text(
        'GOOD EVENING!',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
    default:
      return const Text(
        'GOOD NIGHT!',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
  }
}

Widget getBackgroundBot(int time) {
  switch (time) {
    case >= 5 && < 12:
      return Container(
        height: 300,
        width: 300,
        decoration:
            const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
      );
    case >= 12 && < 16:
      return Container(
        height: 300,
        width: 300,
        decoration:
            const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
      );
    case >= 16 && < 21:
      return Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent, shape: BoxShape.circle),
      );
    default:
      return Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.deepPurple, shape: BoxShape.circle),
      );
  }
}
Widget getBackgroundTop(int time) {
  switch (time) {
    case >= 5 && < 12:
      return Container(
        height: 300,
        width: 300,
        decoration:
            const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle),
      );
    case >= 12 && < 16:
      return Container(
        height: 300,
        width: 300,
        decoration:
            const BoxDecoration(color: Colors.amber, shape: BoxShape.rectangle),
      );
    case >= 16 && < 21:
      return Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent, shape: BoxShape.rectangle),
      );
    default:
      return Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
            color: Colors.deepPurple, shape: BoxShape.rectangle),
      );
  }
}
