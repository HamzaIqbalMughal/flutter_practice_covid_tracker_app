// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_practice_covid_tracker_app/Models/world_states_model.dart';
import 'package:flutter_practice_covid_tracker_app/Services/states_services.dart';
import 'package:flutter_practice_covid_tracker_app/views/countries_list_screen.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  static const String screen_id = 'WorldStatesScreen';

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Colors.blue.shade700,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    StatesServices statesServices = StatesServices();

    return Scaffold(
      // backgroundColor: Colors.transparent,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                  future: statesServices.fetchWorldStatesRecoreds(),
                  builder: (context,AsyncSnapshot<WorldStateModel> snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(snapshot.data!.cases!.toString()),
                              "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                              "Deaths": double.parse(snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            chartRadius: MediaQuery.of(context).size.width * 0.3,
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                              legendTextStyle: TextStyle(color: Colors.white),
                            ),
                            animationDuration: const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height * 0.06),
                            child: Card(
                              color: Colors.grey.shade800,
                              child: Column(
                                children: [
                                  ReuseableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Today Cases',
                                    value: snapshot.data!.todayCases.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Today Deaths',
                                    value: snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered.toString(),
                                  ),
                                  ReuseableRow(
                                    title: 'Total Cases',
                                    value: snapshot.data!.tests.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, CountriesListScreen.screen_id);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Track Countries'),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    else{
                      return Expanded(
                        flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 70,
                            controller: _controller,
                          )
                      );
                    }
                  }
              ),

            ],
          ),
        ),),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;
  const ReuseableRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Text(value),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(thickness: 0.2,),
        ],
      ),
    );
  }
}
