import 'package:wellness_hub_australia/features/pillars/pillar_progress_extension.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PillarProgressCircle extends StatelessWidget {
  final List<PillarProgress> pillars;
  const PillarProgressCircle({Key? key, required this.pillars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 230,
        height: 230,
        child: _PillarProgresssCircularProgress(
            datas: pillars.map((e) {
          return ChartSampleData(
              x: e.title,
              y: e.progress(),
              pointColor: HexColor("${e.colorTheme}"));
        }).toList()),
      ),
    );
  }
}

class _PillarProgresssCircularProgress extends StatelessWidget {
  final List<ChartSampleData> datas;
  const _PillarProgresssCircularProgress({Key? key, required this.datas})
      : super(key: key);

  /// Returns the doughnut series which need to be render.
  List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries() {
    double total = 0.0;

    for (var e in datas) {
      total += e.y ?? 0;
    }

    List<ChartSampleData> finalDatas = datas;
    if (total == 0) {
      finalDatas = [
        ChartSampleData(x: "", y: 100, pointColor: HexColor("#D3D3D7"))
      ];
    }

    if ((total / 4) >= 100) {
      finalDatas = [
        ChartSampleData(x: "", y: 100, pointColor: HexColor("#8A58B2"))
      ];
    }

    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: finalDatas,
        animationDuration: 0,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        explodeAll: true,
        radius: "85%",
        /*  dataLabelMapper: (ChartSampleData data, _) => "${data.y}%",
        dataLabelSettings: const DataLabelSettings(isVisible: true), */
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double total = 0.0;

    for (var e in datas) {
      total += e.y ?? 0;
    }

    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: PhysicalModel(
              shape: BoxShape.circle,
              elevation: 10,
              color: Theme.of(context).cardColor,
              child: Container(),
            )),
        CircularChartAnnotation(
            widget: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('${(total / 4).round()}%',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
            /*     const Text(
              'Total Daily \nProgress',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.2),
            ), */
          ],
        ))
      ],
      /*    title: ChartTitle(
          text: "Total Progress",
          textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins")), */
      margin: const EdgeInsets.all(0),

      // backgroundColor: Colors.red,
      series: _getElevationDoughnutSeries(),
    );
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
