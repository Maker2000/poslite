import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../models/store_transaction/store_transaction.dart';
import '../shared_widgets/loading_screen.dart';
import '../util/chart_data_models.dart';
import '../../controllers/dashboard_controller.dart';
import '../../repositories/store_transactions_repo.dart';

class SalesGraph extends StatelessWidget {
  const SalesGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: 'Total Sales'),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          minimum: 0,
          numberFormat: NumberFormat.compact(),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<SalesChartData, String>>[
          BarSeries<SalesChartData, String>(
            animationDuration: 1000,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            width: 0.7,
            dataSource: [],
            xValueMapper: (SalesChartData data, _) => data.item,
            yValueMapper: (SalesChartData data, _) => data.amountSold,
          )
        ]);
  }
}
