import 'package:gbuagenda/models/section.dart';

import 'package:gbuagenda/providers/data_providers.dart';
import 'package:gbuagenda/notifiers/school_selector.dart';
import 'package:gbuagenda/notifiers/section_selector.dart';
import 'package:gbuagenda/ui/widgets/drop_downs.dart';
import 'package:gbuagenda/ui/widgets/error_widget.dart';

import 'package:gbuagenda/ui/widgets/gbu_agenda_title.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Center(
          child: Column(
            children: [
              const GbuAgendaTitle(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Please Select Your Section",
                style: theme.textTheme.headline3,
              ),
              const SizedBox(
                height: 20,
              ),
              SectionSelector(),
            ],
          ),
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
              ClipRRect(
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
                          "Select a Section",
                          style: theme.textTheme.headline3,
                        ),
                        underline: Container(),
                        dropdownColor: theme.scaffoldBackgroundColor,
                        onChanged: schoolSelector.setschool,
                        items: sections
                            .map(
                              (e) => sectionDropDownTile(e, context),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: theme.accentColor,
                onPressed: () {
                  final sectionPro =
                      context.read(SectionSelectorNotifier.provider);
                  final selectedSection = sectionPro.school;
                  if (selectedSection != null) {
                    sectionPro.persistToDatabase();
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
