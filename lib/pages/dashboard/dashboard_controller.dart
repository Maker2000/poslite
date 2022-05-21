import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poslite/util/chart_data_models.dart';
import 'package:poslite/util/magic_strings.dart';
import '../../repositories/store_transactions_repo.dart';
import '../../util/useful_extensions.dart';
import '../../models/store_transaction/store_transaction.dart';

class DashboardFunctions {
  static Stream<QuerySnapshot<StoreTransaction>> get getSalesToday =>
      StoreTransactionRepository.instance.getAllItems
          .where('transactionType', isEqualTo: StoreTransactionType.sell)
          .where('date', isEqualTo: Timestamp.now())
          .snapshots();
  static List<SalesChartData> salesData(
      List<DocumentSnapshot<StoreTransaction>> docs) {
    List<SalesChartData> data = [];
    for (var doc in docs) {
      doc.data()!.items.groupBy((i) => i.name).forEach((key, value) {
        int total = 0;
        for (var element in value) {
          total += element.amount;
        }
        int index = data.indexWhere((element) => element.item == key);
        if (index == -1) {
          data.add(SalesChartData(key!, total));
        } else {
          data[index].amountSold += total;
        }
      });
    }

    return data;
  }
}
