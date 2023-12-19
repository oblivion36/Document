import 'package:flutter/material.dart';
import 'package:myapp/document/mob_pages/feature/tax.dart';
import 'package:myapp/document/mob_pages/feature/team.dart';
import 'package:myapp/document/mob_pages/feature/joining.dart';
import 'package:myapp/document/mob_pages/feature/transaction.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Document"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              ListTile(
                title: const Text("Joining Document"),
                trailing: IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Joining()),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text("Transaction Document"),
                trailing: IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Transaction()),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text("Team Document"),
                trailing: IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Team()),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text("Tax Document"),
                trailing: IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tax()),
                    );
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}
