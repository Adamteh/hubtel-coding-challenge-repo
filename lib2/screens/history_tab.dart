import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/web_api.dart';
import '../model/transaction_history_model.dart';
import '../widgets/date_chip.dart';
import '../widgets/search_bar.dart';
import '../widgets/transaction_card.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  bool loading = false;

  ///Transaction history
  List<TransactionHistoryModel> transactionHistory = [];

  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });

    List<TransactionHistoryModel> data = await WebApi.fetchTransactionHistory();

    setState(() {
      transactionHistory = data;
      dates = data.map((e) => e.date).toSet().toList();
    });

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () {
              //This closes the keyboard when other parts of the screen is tounched
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Flexible(
                        child: AppSearchBar(),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        "assets/filter.svg",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dates.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        String date = dates[index];

                        List<TransactionHistoryModel> history =
                            transactionHistory
                                .where((e) => e.date == date)
                                .toList();

                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == dates.length - 1 ? 80 : 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, bottom: 16),
                                child: DateChip(date: date),
                              ),
                              ...List.generate(
                                history.length,
                                (index) => TransactionCard(
                                    transaction: history[index]),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
