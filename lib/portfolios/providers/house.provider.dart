import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HouseProvider extends ChangeNotifier {
  HouseProvider() {
    getList();
  }

  List list = [];
  Future<void> getList() async {
    list = await FirebaseFirestore.instance
        .collection('houses')
        .get()
        .then((value) => value.docs);
    notifyListeners();
    print(list.length);
  }
}
