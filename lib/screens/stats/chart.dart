import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(mainBarChart());
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary
            ],
            transform: const GradientRotation(pi / 40),
          ),
          width: 14,
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 5, color: Colors.grey.shade300),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 3.8);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.4);
          case 6:
            return makeGroupData(6, 1.4);
          case 7:
            return makeGroupData(7, 1.4);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarChart() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 45,
            getTitlesWidget: leftTitle,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: style);
        break;
      case 1:
        text = const Text('02', style: style);
        break;
      case 2:
        text = const Text('03', style: style);
        break;
      case 3:
        text = const Text('04', style: style);
        break;
      case 4:
        text = const Text('05', style: style);
        break;
      case 5:
        text = const Text('06', style: style);
        break;
      case 6:
        text = const Text('07', style: style);
        break;
      case 7:
        text = const Text('08', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget leftTitle(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15);
    String text;

    if (value == 0) {
      text = '0k';
    } else if (value == 1) {
      text = '10k';
    } else if (value == 2) {
      text = '20k';
    } else if (value == 3) {
      text = '30k';
    } else if (value == 4) {
      text = '40k';
    } else if (value == 5) {
      text = '50k';
    } else if (value == 6) {
      text = '60k';
    } else if (value == 7) {
      text = '70k';
    } else if (value == 8) {
      text = '80k';
    } else {
      return Container();
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16,
        child: Text(
          text,
          style: style,
        ));
  }
}