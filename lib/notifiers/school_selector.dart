import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hive/hive.dart';

class SchoolSelectorNotifier extends ChangeNotifier {
  static final AutoDisposeChangeNotifierProvider<SchoolSelectorNotifier>
      provider =
      ChangeNotifierProvider.autoDispose((r) => SchoolSelectorNotifier());
  School _school;
  School get school => _school;
  void persistToDatabase() =>
      Hive.box<dynamic>(Constants.appBox).put("SelectedSchool", _school);

  School getFromDatabase() =>
      Hive.box<dynamic>(Constants.appBox).get("SelectedSchool") as School;

  void setschool(School s) {
    _school = s;
    notifyListeners();
  }
}
