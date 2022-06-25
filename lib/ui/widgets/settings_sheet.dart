import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/notifiers/school_selector.dart';
import 'package:gbuagenda/notifiers/section_selector.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/text_theme.dart';

class SettingsSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    return BottomSheet(
      backgroundColor: Colors.black,
      onClosing: () {
        Navigator.of(context).pop();
      },
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            color: Colours.scaffold,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Settings",
                          style: textTheme.headline2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "School",
                                  style: textTheme.headline3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      "/school",
                                      (r) => false,
                                    );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: Colours.lightScaffold,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'School of ${ref.read(SchoolSelectorNotifier.provider).getFromDatabase().fullName}',
                                        style: textTheme.headline4,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Section",
                                  style: textTheme.headline3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      "/section",
                                      (r) => false,
                                    );
                                  },
                                  child: Card(
                                    color: Colours.lightScaffold,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        ref
                                            .read(
                                              SectionSelectorNotifier.provider,
                                            )
                                            .getFromDatabase()
                                            .programName,
                                        style: textTheme.headline4,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Creator",
                                  style: textTheme.headline3,
                                ),
                                Card(
                                  elevation: 0,
                                  color: Colours.lightScaffold,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sumit Kumar",
                                      style: textTheme.headline4,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(4),
                color: Colours.accent,
                child: Text(
                  "This project is fully open source and the source code can be found at my Github.",
                  style: textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
