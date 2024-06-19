class TransactionHistoryModel {
  final String time;
  final String name;
  final String number;
  final String amount;
  final String subtext;
  final String? subtext1;
  final String date;

  final bool mtnMomo;
  final bool success;
  final bool star;

  TransactionHistoryModel({
    required this.time,
    required this.name,
    required this.number,
    required this.amount,
    required this.subtext,
    required this.subtext1,
    required this.date,
    required this.mtnMomo,
    required this.success,
    required this.star,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        time: json['time'],
        name: json['name'],
        number: json['number'],
        amount: json['amount'],
        subtext: json['subtext'],
        subtext1: json['subtext1'],
        date: json['date'],
        mtnMomo: json['mtnMomo'] ?? true,
        success: json['success'] ?? true,
        star: json['star'] ?? true,
      );
}
