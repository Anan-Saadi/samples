import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class provider extends ChangeNotifier{
  late Isar isar;
  String searchTerm ='';

  void updateSearchTerm(value){
      searchTerm = value;
      notifyListeners();
  }
}