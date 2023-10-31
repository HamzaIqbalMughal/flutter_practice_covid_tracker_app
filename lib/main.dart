import 'package:flutter/material.dart';
import 'package:flutter_practice_covid_tracker_app/views/countries_list_screen.dart';
import 'package:flutter_practice_covid_tracker_app/views/country_detail_screen.dart';
import 'package:flutter_practice_covid_tracker_app/views/splash_screen.dart';
import 'package:flutter_practice_covid_tracker_app/views/world_states_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen(),
      initialRoute: SplashScreen.screen_id,
      routes: {
        SplashScreen.screen_id : (context) => SplashScreen(),
        WorldStatesScreen.screen_id : (context) => WorldStatesScreen(),
        CountriesListScreen.screen_id : (context) => CountriesListScreen(),
        // CountryDetailScreen.screen_id : (context) => CountryDetailScreen(),
      },
    );
  }
}