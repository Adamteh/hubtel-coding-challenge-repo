import 'package:flutter/material.dart';

import 'history_tab.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          // give the tab bar a height [can change height to preferred height]
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.all(2.5),
              height: 50,
              margin: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE6EAED),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                splashBorderRadius: BorderRadius.circular(8),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                tabs: const [
                  Tab(text: "History"),
                  Tab(text: "Transaction Summary"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xFFE6EAED),
            thickness: 2,
          ),
          const SizedBox(height: 17),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              clipBehavior: Clip.none,
              children: [
                const HistoryTab(),
                Container(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 158,
        height: 56,
        child: FloatingActionButton.extended(
          label: const Text(
            "SEND NEW",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.add_circle_sharp, size: 30),
          backgroundColor: const Color(0xFF01C7B1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
