import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/document/mob_pages/model.dart';
import 'package:url_launcher/url_launcher.dart';

late Model data;
bool isloading = false;

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
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
      appBar: AppBar(
        title: const Text('Transaction Documents'),
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.value?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children:
                            (data.value?[index].transaction as List<dynamic>)
                                .map<Widget>((transaction) => ListTile(
                                      title: Text(transaction.address),
                                      subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Transaction ID: #${transaction.transactionId}',
                                            ),
                                            Text(
                                              'Settled on : ${transaction.documents[2]?.date}',
                                            ),
                                          ]),
                                      trailing: const Icon(Icons.arrow_forward),
                                      hoverColor: Colors.blue,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Document1()),
                                        );
                                      },
                                    ))
                                .toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class Document1 extends StatefulWidget {
  const Document1({super.key});

  @override
  State<Document1> createState() => _Document1State();
}

class _Document1State extends State<Document1> {
  Future<void> _launchUrl(String? url) async {
    // ignore: deprecated_member_use
    if (url != null && await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Documents'),
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.value!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: (data.value?[index].transaction
                                as List<dynamic>)
                            .map<Widget>((transaction) => ListTile(
                                  title: Text(
                                      'Transaction Address: ${transaction.address}'),
                                  subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Transaction ID: #${transaction.transactionId}',
                                        ),
                                        Text(
                                          'Document Name :  ${transaction.documents[1]?.title ?? "N/A"}',
                                        ),
                                      ]),
                                  hoverColor: Colors.blue,
                                  onTap: () {
                                    _launchUrl(
                                        transaction.documents[1]?.url ?? "N/A");
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
