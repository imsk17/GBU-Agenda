import 'package:GbuAgenda/models/section.dart';

import 'package:GbuAgenda/providers/data_providers.dart';
import 'package:GbuAgenda/notifiers/school_selector.dart';
import 'package:GbuAgenda/notifiers/section_selector.dart';
import 'package:GbuAgenda/ui/widgets/error_widget.dart';

import 'package:GbuAgenda/ui/widgets/gbu_agenda_title.dart';
import 'package:GbuAgenda/utils/colours.dart';
import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/extensions.dart';

class SectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              child: const GbuAgendaTitle(),
            ),
            Text(
              "Please Select Your Section",
              style: theme.textTheme.headline3,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SectionSelector(),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final schoolSelector = watch(SectionSelectorNotifier.provider);
    final sectionsPro = watch(
      DataProviders.section(
        context.read(SchoolSelectorNotifier.provider).getFromDatabase().name,
      ),
    );
    return ProviderListener<AsyncValue<List<Section>>>(
      onChange: (context, value) {
        if (value is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((value as AsyncError).error.toString()),
            ),
          );
        }
      },
      provider: DataProviders.section(
          context.read(SchoolSelectorNotifier.provider).getFromDatabase().name),
      child: sectionsPro.when(
        data: (sections) {
          return Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colours.lightScaffold,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        DropdownButton<Section>(
                          value: schoolSelector.school,
                          hint: Text(
                            "Select a Value",
                            style: theme.textTheme.headline3,
                          ),
                          underline: Container(),
                          dropdownColor: theme.scaffoldBackgroundColor,
                          onChanged: schoolSelector.setschool,
                          items: sections
                              .map(
                                (e) => DropdownMenuItem<Section>(
                                  value: e,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: OverflowBar(
                                      children: [
                                        Text(
                                          "${e.programName} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.headline4,
                                        ),
                                        Text(
                                          "${e.sectionName.trim()} - Sem - ${e.semester}",
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.headline4
                                              .toAccent(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                color: theme.accentColor,
                onPressed: () {
                  final selectedSection =
                      context.read(SectionSelectorNotifier.provider).school;
                  if (selectedSection != null) {
                    context
                        .read(SectionSelectorNotifier.provider)
                        .persistToDatabase();
                    Navigator.pushReplacementNamed(context, "/timetable");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Pfft!.. Dumb human, Pick a section first."),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Lets See The Timetable",
                      style: theme.textTheme.headline3,
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (_, __) => NetError(
          futurePro: DataProviders.section(
            context
                .read(SchoolSelectorNotifier.provider)
                .getFromDatabase()
                .name,
          ),
        ),
      ),
    );
  }
}
