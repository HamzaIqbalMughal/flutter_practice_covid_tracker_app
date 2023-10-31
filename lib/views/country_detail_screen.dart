import 'package:flutter/material.dart';
import 'package:flutter_practice_covid_tracker_app/Models/country_model.dart';
import 'package:flutter_practice_covid_tracker_app/views/world_states_screen.dart';

class CountryDetailScreen extends StatefulWidget {


  // const CountryDetailScreen({super.key});

  CountryModel countryModel;

  CountryDetailScreen({Key? key, required this.countryModel});

  static const String screen_id = 'CountryDetailScreen';

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState(country: countryModel);
  // State<CountryDetailScreen> createState() => _CountryDetailScreenState();

}

class _CountryDetailScreenState extends State<CountryDetailScreen> {

  CountryModel country;
  _CountryDetailScreenState({required this.country});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(country.country.toString()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReuseableRow(title: 'Total Cases', value: country.cases.toString()),
                      ReuseableRow(title: 'Recovered', value: country.recovered.toString()),
                      ReuseableRow(title: 'Deaths', value: country.deaths.toString()),
                      ReuseableRow(title: 'Active', value: country.active.toString()),
                      ReuseableRow(title: 'Total Tests', value: country.tests.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(country.countryInfo!.flag.toString()),
              )
            ],
          )
        ],
      ),
    );
  }
}
