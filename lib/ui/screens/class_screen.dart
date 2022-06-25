import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/models/class.dart';
import 'package:gbuagenda/providers/data_providers.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:gbuagenda/utils/text_theme.dart';

class ClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Class _class = ModalRoute.of(context).settings.arguments as Class;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colours.accent,
        title: Text(_class.subject.code),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colours.lightScaffold,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Subject - ${_class.subject.name}",
                  style: textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colours.lightScaffold,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Timing - ${kClassTimingsMap[_class.period]}",
                  style: textTheme.headline4,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colours.lightScaffold,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Faculty Name - ${_class.teacher.name} (${_class.teacher.abbr})",
                  style: textTheme.headline4,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colours.lightScaffold,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Room No - ${_class.room.name}",
                  style: textTheme.headline4,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(
              builder: (context, ref, child) {
                final subject =
                    ref.watch(DataProviders.subject(_class.subject.code));
                return subject.when(
                  data: (s) {
                    return Card(
                      color: Colours.lightScaffold,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "School - ${s.school}",
                                  style: textTheme.headline3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Department - ${s.deptCode}",
                                  style: textTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Lab - ${s.l}",
                                  style: textTheme.headline3,
                                ),
                                Text(
                                  "Theory - ${s.t}",
                                  style: textTheme.headline3,
                                ),
                                Text(
                                  "Practical - ${s.p}",
                                  style: textTheme.headline3,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (e, _) {
                    return Center(
                      child: Card(
                        color: Colours.lightScaffold,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            e.toString(),
                            textAlign: TextAlign.center,
                            style:
                                textTheme.headline3.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
