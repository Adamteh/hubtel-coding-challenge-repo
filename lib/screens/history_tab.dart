import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  void initState() {
    super.initState();
    showLoading();
  }

  Future<void> showLoading() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
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
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          DateChip(date: "May 24, 2022"),
                          SizedBox(height: 16),
                          TransactionCard(
                            time: "14:45PM",
                            name: "Emmanuel Rockson Kwabena Uncle Ebo",
                            number: "024 123 4567",
                            amount: "GHS 500",
                            subtext: "Personal",
                            subtext1: "Cool your heart wai",
                          ),
                          TransactionCard(
                            time: "14:45PM",
                            name: "Absa Bank",
                            number: "024 123 4567",
                            amount: "GHS 500",
                            subtext: "Personal",
                            subtext1: "Cool your heart wai",
                            mtnMomo: false,
                            star: false,
                            success: false,
                          ),

                          //
                          SizedBox(height: 25),
                          DateChip(date: "May 23, 2022"),
                          SizedBox(height: 16),
                          TransactionCard(
                            time: "14:45PM",
                            name: "Emmanuel Rockson",
                            number: "024 123 4567",
                            amount: "GHS 500",
                            subtext: "Other",
                            subtext1: "Cool your heart wai",
                          ),
                          TransactionCard(
                            time: "14:45PM",
                            name: "Emmanuel Rockson",
                            number: "024 123 4567",
                            amount: "GHS 500",
                            subtext: "Other",
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
