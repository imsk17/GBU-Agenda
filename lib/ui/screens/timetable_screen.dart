import 'package:gbuagenda/notifiers/section_selector.dart';
import 'package:gbuagenda/providers/data_providers.dart';
import 'package:gbuagenda/ui/widgets/settings_sheet.dart';
import 'package:gbuagenda/ui/widgets/class_card.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:gbuagenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:gbuagenda/utils/extensions.dart';
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
                "Last Updated: ${(timeago.format(DateTime.parse(Hive.box(Constants.appBox).get(Constants.timeTableFetchKey) as String))).titleCase} ",
                style: theme.textTheme.headline3.copyWith(fontSize: 13),
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
                    key: Key(kDaysMap[key]),
                    child: Text(
                      kDaysMap[key],
                      style: theme.textTheme.headline3,
                    ),
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
                      style: theme.textTheme.headline1
                          .copyWith(color: theme.accentColor, fontSize: 22),
                    ),
                    TextSpan(
                      text: 'Agenda',
                      style: theme.textTheme.headline1
                          .copyWith(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (c) => SettingsSheet(),
                  );
                },
              ),
            ],
          ),
          body: d.showTt == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning,
                      size: 50,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        "No Timetable For You.\nJK! Your timetable is not in Database.",
                        style: theme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : TabBarView(
                  children: d.days.keys.map(
                    (day) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RefreshIndicator(
                          color: Colors.white,
                          backgroundColor: theme.accentColor,
                          onRefresh: () => context.refresh(
                            DataProviders.timeTable(section.sectionId),
                          ),
                          child: ListView.builder(
                            itemCount: (d.days[day]).length,
                            itemBuilder: (context, index) {
                              return ClassCard(
                                d.days[day][index],
                              );
                            },
                          ),
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
