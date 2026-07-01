import 'package:flutter/material.dart';
import 'package:dating_app/presentation/pages/home_page.dart';
import 'package:dating_app/presentation/pages/chat_screen.dart';
import 'package:dating_app/presentation/pages/date_now_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const DateNowScreen(),
    const Center(child: Text('Admirers')),
    const ChatScreen(),
    const Center(child: Text('Events')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFE84C66),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Date Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Admirers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}
