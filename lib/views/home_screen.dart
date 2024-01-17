import 'package:demo_api_project/views/api_views/cat_facts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API CONNECTION'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children:  [
          const CatFacts(),
          //Zde se mohou přidat další stránky viz BottomNavigationBar.
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Cats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'BTC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Bored',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


