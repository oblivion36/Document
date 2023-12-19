import 'package:flutter/material.dart';
import 'package:myapp/document/web_pages/drawer.dart';
import 'package:myapp/document/web_pages/tabs/joiningtab.dart';
import 'package:myapp/document/web_pages/tabs/taxtab.dart';
import 'package:myapp/document/web_pages/tabs/teamtab.dart';
import 'package:myapp/document/web_pages/tabs/transactiontab.dart';

class Window extends StatefulWidget {
  const Window({super.key});

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Documents"),
        ),
        drawer: const Drawerview(
          title: 'Web View',
        ),
        body: const Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: "Joining ",
              ),
              Tab(text: "Transaction "),
              Tab(text: "Team "),
              Tab(text: "Tax "),
            ]),
            Expanded(
              child: TabBarView(children: [
                Joiningtab(),
                Transactiontab(),
                Teamtab(),
                Taxtab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
