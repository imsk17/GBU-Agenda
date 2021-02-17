import 'package:GbuAgenda/models/school.dart';

import 'package:GbuAgenda/providers/data_providers.dart';
import 'package:GbuAgenda/notifiers/school_selector.dart';
import 'package:GbuAgenda/ui/widgets/error_snackbar.dart';
import 'package:GbuAgenda/ui/widgets/error_widget.dart';

import 'package:GbuAgenda/ui/widgets/gbu_agenda_title.dart';
import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchoolScreen extends StatelessWidget {
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
            Text("Please Select Your School", style: theme.textTheme.headline3),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SchoolSelector(),
            ),
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
            ErrorSnackbar(
              message: (value as AsyncError).error.toString(),
            ).build(
              context,
            ),
          );
        }
      },
      provider: DataProviders.school,
      child: schools.when(
        data: (schools) {
          return Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colours.lightScaffold,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        DropdownButton<School>(
                          value: schoolSelector.school,
                          hint: Text(
                            "Select a Value",
                            style: theme.textTheme.headline3,
                          ),
                          underline: Container(),
                          dropdownColor: theme.scaffoldBackgroundColor,
                          onChanged: schoolSelector.setschool,
                          items: schools
                              .map(
                                (e) => DropdownMenuItem<School>(
                                  value: e,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('School of ',
                                            style: theme.textTheme.headline3),
                                        Flexible(
                                          child: Text(
                                            e.fullName.trim(),
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.headline3
                                                .toAccent(),
                                          ),
                                        ),
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
                  final selectedSchool =
                      context.read(SchoolSelectorNotifier.provider).school;
                  if (selectedSchool != null) {
                    context
                        .read(SchoolSelectorNotifier.provider)
                        .persistToDatabase();
                    Navigator.of(context).pushReplacementNamed("/section");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const ErrorSnackbar(
                        message: "Pfft!.. Dumb human, Pick a school first.",
                      ).build(context),
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
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (_, __) {
          return NetError(
            futurePro: DataProviders.school,
          );
        },
      ),
    );
  }
}
