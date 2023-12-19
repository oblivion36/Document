import 'package:flutter/material.dart';
import 'package:myapp/document/mob_pages/document.dart';
import 'package:myapp/document/mob_pages/login.dart';

class Mobileview extends StatefulWidget {
  const Mobileview({super.key});

  @override
  State<Mobileview> createState() => _MobileviewState();
}

class _MobileviewState extends State<Mobileview> {
  int index = 1;
  final List<Widget> screens = [
    const Document(),
    const Login(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              backgroundColor: Colors.blue,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.file_copy_outlined),
                    selectedIcon: Icon(Icons.file_copy),
                    label: 'Document'),
                NavigationDestination(
                    icon: Icon(Icons.login_outlined),
                    selectedIcon: Icon(Icons.login),
                    label: 'Login'),
              ]),
        ));
  }
}
