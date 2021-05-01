import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gbuagenda/di/locator.dart';
import 'package:gbuagenda/models/bsubject.dart';
import 'package:gbuagenda/models/bteacher.dart';
import 'package:gbuagenda/models/class.dart';
import 'package:gbuagenda/models/room.dart';
import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/timetable.dart';
import 'package:gbuagenda/notifiers/school_selector.dart';
import 'package:gbuagenda/notifiers/section_selector.dart';
import 'package:gbuagenda/ui/screens/class_screen.dart';
import 'package:gbuagenda/ui/screens/school_screen.dart';
import 'package:gbuagenda/ui/screens/section_screen.dart';
import 'package:gbuagenda/ui/screens/timetable_screen.dart';
import 'package:gbuagenda/ui/screens/welcome_screen.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:gbuagenda/utils/is_debug.dart';
import 'package:gbuagenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry/sentry.dart';

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
  Hive.registerAdapter(SubjectAdapter());
  await Hive.openBox(Constants.appBox);

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  await Sentry.init(
    (options) {
      options.dsn =
          'https://0b8a4d76ae604cf486c69ccdeb08cac8@o457967.ingest.sentry.io/5545717';
    },
    appRunner: () => runApp(ProviderScope(child: GBUAgenda())),
  );
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
        "/": (_) {
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
        "/timetable": (_) => TimetableScreen(),
        "/class": (_) => ClassScreen()
      },
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
