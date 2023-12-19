import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/document/mob_pages/model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(String? url) async {
  // ignore: deprecated_member_use
  if (url != null && await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Taxtab extends StatefulWidget {
  const Taxtab({super.key});

  @override
  State<Taxtab> createState() => _TaxtabState();
}

class _TaxtabState extends State<Taxtab> {
  late Model data;
  bool isloading = false;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    isloading = true;

    var d = await rootBundle.loadString('assets/Documents (2).json');
    data = modelfromjson(d.toString());
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.value?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: (data.value?[index].tax as List<dynamic>)
                        .map<Widget>((tax) => ListTile(
                              title: Text(tax.title),
                              subtitle: Text('Size: ${tax.size}'),
                              trailing: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.blue,
                              ),
                              hoverColor: Colors.blue,
                              onTap: () {
                                _launchUrl(tax.url);
                              },
                            ))
                        .toList(),
                  ),
                );
              },
            ),
    );
  }
}
