import 'dart:async';

import 'package:GbuAgenda/di/locator.dart';
import 'package:GbuAgenda/models/bsubject.dart';
import 'package:GbuAgenda/models/bteacher.dart';
import 'package:GbuAgenda/models/class.dart';
import 'package:GbuAgenda/models/room.dart';
import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/notifiers/school_selector.dart';
import 'package:GbuAgenda/notifiers/section_selector.dart';
import 'package:GbuAgenda/ui/screens/school_screen.dart';
import 'package:GbuAgenda/ui/screens/section_screen.dart';
import 'package:GbuAgenda/ui/screens/timetable_screen.dart';
import 'package:GbuAgenda/ui/screens/welcome_screen.dart';
import 'package:GbuAgenda/utils/constants.dart';
import 'package:GbuAgenda/utils/is_debug.dart';
import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(SchoolAdapter());
  Hive.registerAdapter(SectionAdapter());
  Hive.registerAdapter(TimetableAdapter());
  Hive.registerAdapter(ClassAdapter());
  Hive.registerAdapter(BSubjectAdapter());
  Hive.registerAdapter(BTeacherAdapter());
  Hive.registerAdapter(RoomAdapter());
  await Hive.openBox(Constants.appBox);

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  await SentryFlutter.init((options) {
    options.debug = isInDebugMode;
    options.dsn =
        'https://0b8a4d76ae604cf486c69ccdeb08cac8@o457967.ingest.sentry.io/5545717';
  }, appRunner: () => runApp(ProviderScope(child: GBUAgenda())));
}

class GBUAgenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor,
      ),
    );
    return MaterialApp(
      routes: {
        "/": (ctx) {
          final isSchoolSelected =
              context.read(SchoolSelectorNotifier.provider).getFromDatabase();
          final isSectionSelected =
              context.read(SectionSelectorNotifier.provider).getFromDatabase();
          if (isSectionSelected == null && isSchoolSelected == null) {
            return const WelcomeScreen();
          } else if (isSectionSelected != null) {
            return TimetableScreen();
          } else if (isSchoolSelected != null) {
            return SchoolScreen();
          }
          return const WelcomeScreen();
        },
        "/school": (_) => SchoolScreen(),
        "/section": (_) => SectionScreen(),
        "/timetable": (_) => TimetableScreen()
      },
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
