import 'package:GbuAgenda/models/school.dart';

import 'package:GbuAgenda/providers/data_providers.dart';
import 'package:GbuAgenda/notifiers/school_selector.dart';
import 'package:GbuAgenda/ui/widgets/error_widget.dart';

import 'package:GbuAgenda/ui/widgets/gbu_agenda_title.dart';
import 'package:GbuAgenda/ui/widgets/drop_downs.dart';
import 'package:GbuAgenda/utils/colours.dart';
import 'package:GbuAgenda/utils/text_theme.dart';
import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GbuAgendaTitle(),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Please Select Your School",
              style: textTheme.headline3,
            ),
            const SizedBox(
              height: 20,
            ),
            SchoolSelector()
          ],
        ),
      ),
    );
  }
}

class SchoolSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final schoolSelector = watch(SchoolSelectorNotifier.provider);
    final schools = watch(DataProviders.school);
    return ProviderListener<AsyncValue<List<School>>>(
      onChange: (context, value) {
        if (value is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (value as AsyncError).error.toString(),
              ),
            ),
          );
        }
      },
      provider: DataProviders.school,
      child: schools.when(
        data: (schools) {
          return Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colours.lightScaffold,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: DropdownButton<School>(
                      value: schoolSelector.school,
                      hint: Text(
                        "Select a School",
                        style: theme.textTheme.headline3,
                      ),
                      underline: Container(),
                      dropdownColor: theme.scaffoldBackgroundColor,
                      onChanged: schoolSelector.setschool,
                      items: schools
                          .map(
                            (e) => schoolDropDownTile(e, context),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: theme.accentColor,
                  onPressed: () {
                    final schoolSelPro =
                        context.read(SchoolSelectorNotifier.provider);
                    final selectedSchool = schoolSelPro.school;
                    if (selectedSchool != null) {
                      schoolSelPro.persistToDatabase();
                      Navigator.of(context).pushReplacementNamed("/section");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Pfft!.. Dumb human, Pick a school first."),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Next Up, Section",
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
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (o, __) {
          return NetError(
            futurePro: DataProviders.school,
          );
        },
      ),
    );
  }
}
