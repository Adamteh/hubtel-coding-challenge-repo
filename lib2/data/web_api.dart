import '../model/transaction_history_model.dart';
import 'data_source.dart';

class WebApi {
  ///Fetch transaction history data
  static Future<List<TransactionHistoryModel>> fetchTransactionHistory() async {
    await Future.delayed(const Duration(seconds: 1));

    return List.from(
      DataSource.transactionHistoryData
          .map((e) => TransactionHistoryModel.fromJson(e)),
    );
  }
}
