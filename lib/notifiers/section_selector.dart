import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:hive/hive.dart';

class SectionSelectorNotifier extends ChangeNotifier {
  static final AutoDisposeChangeNotifierProvider<SectionSelectorNotifier>
      provider =
      ChangeNotifierProvider.autoDispose((r) => SectionSelectorNotifier());
  Section? _section;
  Section? get school => _section;
  void persistToDatabase() =>
      Hive.box<dynamic>(Constants.appBox).put("SelectedSection", _section);

  Section? getFromDatabase() =>
      Hive.box<dynamic>(Constants.appBox).get("SelectedSection") as Section?;

  void setschool(Section? s) {
    _section = s;
    notifyListeners();
  }
}
