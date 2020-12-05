import 'dart:async';

import 'package:GbuAgenda/utils/is_debug.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  await SentryFlutter.init(
    (options) {
      options.debug = isInDebugMode;
      options.dsn =
          'https://0b8a4d76ae604cf486c69ccdeb08cac8@o457967.ingest.sentry.io/5545717';
    },
    appRunner: () => runApp(GBUAgenda()),
  );
}

class GBUAgenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              'GBU Agenda',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
