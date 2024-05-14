import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'history_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;

  final List<Widget> _screens = <Widget>[
    SvgPicture.asset("assets/home.svg", width: 50),
    SvgPicture.asset("assets/send.svg", width: 50),
    const HistoryScreen(),
    SvgPicture.asset("assets/schedule.svg", width: 50)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFCCF3EF),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: SvgPicture.asset("assets/home.svg"),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 0.5,
                  color: Colors.grey,
                )
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/send.svg",
              colorFilter: _selectedIndex == 1
                  ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : null,
            ),
            label: "Send",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/history.svg"),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/schedule.svg",
              colorFilter: _selectedIndex == 3
                  ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : null,
            ),
            label: "Scheduled",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFCBCBCB),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
