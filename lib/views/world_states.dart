// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen> with TickerProviderStateMixin {

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .01,),
                PieChart(
                    dataMap: {
                      "Total": 20,
                      "Recovered": 15,
                      "Deaths": 5,
                    },

                  chartRadius: MediaQuery.of(context).size.width * 0.4,

                  legendOptions: const LegendOptions(
                    legendPosition: LegendPosition.left,
                  ),
                  animationDuration: const Duration(microseconds: 1200),
                  chartType: ChartType.ring,
                  colorList: colorList,
                ),
              ],
            ),
          )
      ),
    );
  }
}
