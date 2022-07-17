import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HouseProvider extends ChangeNotifier {
  HouseProvider() {
    getList();
  }

  List list = [];
  List initList = [];

  Future<void> getList() async {
    list = await FirebaseFirestore.instance
        .collection('houses')
        .get()
        .then((value) => value.docs);
    initList = list;
    notifyListeners();
    print(list.length);
  }

  void filterList(String search) {
    List filter = [];
    list.forEach((element) {
      if (element['name'].contains(search)) {
        filter.add(element);
      }
    });
    list = filter;
  }

  void resetList() {
    list = initList;
  }
}
