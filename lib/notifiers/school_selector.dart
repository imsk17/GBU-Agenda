import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:hive/hive.dart';

class SchoolSelectorNotifier extends ChangeNotifier {
  static final AutoDisposeChangeNotifierProvider<SchoolSelectorNotifier>
      provider =
      ChangeNotifierProvider.autoDispose((r) => SchoolSelectorNotifier());
  School? _school;
  School? get school => _school;
  void persistToDatabase() =>
      Hive.box<dynamic>(Constants.appBox).put("SelectedSchool", _school);

  School? getFromDatabase() =>
      Hive.box<dynamic>(Constants.appBox).get("SelectedSchool") as School?;

  void setschool(School? s) {
    _school = s;
    notifyListeners();
  }
}
