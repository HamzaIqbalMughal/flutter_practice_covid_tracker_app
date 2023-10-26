// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06),
              child: Card(
                child: Column(
                  children: [
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                    ReuseableRow(
                      title: 'Total',
                      value: '200',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff1aa260),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Track Countries'),
              ),
            )
          ],
        ),
      )),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
