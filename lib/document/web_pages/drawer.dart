import 'package:flutter/material.dart';
import 'package:myapp/document/views/windows.dart';

class Drawerview extends StatefulWidget {
  const Drawerview({super.key, required this.title});

  final String title;

  @override
  State<Drawerview> createState() => _DrawerviewState();
}

class _DrawerviewState extends State<Drawerview> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            hoverColor: Colors.blue,
            
            title: const Text('Documents'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Window()),
              );
            },
          ),
        ],
      ),
    );
  }
}
