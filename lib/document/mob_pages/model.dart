import 'dart:convert';

Model modelfromjson(String str) => Model.fromJson(json.decode(str));

class Model {
  List<Value>? value;

  Model({this.value});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(Value.fromJson(v));
      });
    }
  }
}

class Value {
  List<Joining>? joining;
  List<Transaction>? transaction;
  List<Team>? team;
  List<Tax>? tax;

  Value({
    this.joining,
    this.transaction,
    this.team,
    this.tax,
  });

  Value.fromJson(Map<String, dynamic> json) {
    if (json['joining'] != null) {
      joining = <Joining>[];
      json['joining'].forEach((v) {
        joining!.add(Joining.fromJson(v));
      });
    }
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(Transaction.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(Team.fromJson(v));
      });
    }
    if (json['tax'] != null) {
      tax = <Tax>[];
      json['tax'].forEach((v) {
        tax!.add(Tax.fromJson(v));
      });
    }
  }

  // String get title => null;
}

class Joining {
  String? title;
  String? size;
  String? url;

  Joining({this.title, this.size, this.url});

  Joining.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    size = json['size'];
    url = json['url'];
  }
}

class Transaction {
  String? address;
  int? transactionId;
  List<Documents>? documents;

  Transaction({this.address, this.transactionId, this.documents});

  Transaction.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    transactionId = json['transactionId'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }
}

class Documents {
  String? title;
  String? checkListName;
  String? date;
  String? status;
  String? url;

  Documents({this.title, this.checkListName, this.date, this.status, this.url});

  Documents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    checkListName = json['checkListName'];
    date = json['date'];
    status = json['status'];
    url = json['url'];
  }

  @override
  String toString() {
    return 'Documents(title: $title, checkListName: $checkListName, date: $date, status: $status, url: $url)';
  }
}

class Team {
  String? title;
  String? size;
  String? url;

  Team({this.title, this.size, this.url});

  Team.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    size = json['size'];
    url = json['url'];
  }
}

class Tax {
  String? title;
  String? size;
  String? url;

  Tax({this.title, this.size, this.url});

  Tax.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    size = json['size'];
    url = json['url'];
  }
}
