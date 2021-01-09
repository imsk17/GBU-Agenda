import 'package:GbuAgenda/providers/data_providers.dart';
import 'package:GbuAgenda/notifiers/section_selector.dart';
import 'package:GbuAgenda/ui/widgets/class_card.dart';
import 'package:GbuAgenda/utils/constants.dart';
import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimetableScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final section = context
        .read(
          SectionSelectorNotifier.provider,
        )
        .getFromDatabase();
    final timetable = watch(
      DataProviders.timeTable(
        section.sectionId,
      ),
    );

    return timetable.when(
      data: (d) => DefaultTabController(
        length: d.days.length,
        child: Scaffold(
          bottomSheet: Container(
            height: 16,
            color: theme.accentColor,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Last Updated: ${timeago.format(DateTime.parse(Hive.box(Constants.appBox).get(Constants.timeTableFetchKey) as String))} ",
                style: theme.textTheme.headline6.copyWith(fontSize: 12),
              ),
            ),
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: d.days.keys.map(
                (key) {
                  return Tab(
                    text: kDaysMap[key],
                    key: Key(kDaysMap[key]),
                  );
                },
              ).toList(),
            ),
            elevation: 0,
            backgroundColor: theme.scaffoldBackgroundColor,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'GBU',
                      style: theme.textTheme.headline2
                          .copyWith(color: theme.accentColor, fontSize: 22),
                    ),
                    TextSpan(
                      text: 'Agenda',
                      style: theme.textTheme.headline2.copyWith(fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "School - ",
                          style:
                              theme.textTheme.headline6.copyWith(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/school");
                          },
                          child: Text(
                            section.school,
                            style: theme.textTheme.headline6.copyWith(
                                color: theme.accentColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Course - ",
                          style:
                              theme.textTheme.headline6.copyWith(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/section");
                          },
                          child: Text(
                            section.sectionName,
                            style: theme.textTheme.headline6.copyWith(
                              color: theme.accentColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          body: TabBarView(
            children: d.days.keys.map(
              (day) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: (d.days[day]).length,
                    itemBuilder: (context, index) {
                      return ClassCard(
                        d.days[day][index],
                      );
                    },
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
      loading: () => Scaffold(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      error: (f, _) => Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
              context.refresh(DataProviders.timeTable(section.sectionId));
            },
            child: Text(
              "Retry",
              style: theme.textTheme.headline6,
            ),
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
