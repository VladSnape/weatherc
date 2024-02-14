import 'package:flutter/material.dart';
import 'package:weatherc/features/settings/settings_page.dart';
import 'package:weatherc/weather/view/pages/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List<Widget> pages = [const MainPage(), const SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings')
          ]),
    );
  }
}
