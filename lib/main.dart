import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_link/constant.dart/constring.dart';
import 'package:travel_link/page/add_page.dart';
import 'package:travel_link/page/home_page.dart';

import 'model/location.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocationAdapter());
  await Future.wait([Hive.openBox<Location>(ConstantString.hivebox)]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List page = [Home(), AppPage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.grey.withOpacity(0.1),
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.add),
            title: const Text("Add"),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
