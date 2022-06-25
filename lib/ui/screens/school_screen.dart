import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/notifiers/school_selector.dart';
import 'package:gbuagenda/providers/data_providers.dart';
import 'package:gbuagenda/ui/widgets/drop_downs.dart';
import 'package:gbuagenda/ui/widgets/error_widget.dart';
import 'package:gbuagenda/ui/widgets/gbu_agenda_title.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/text_theme.dart';
import 'package:gbuagenda/utils/theme_data.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
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
      ),
    );
  }
}

class SchoolSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final schoolSelector = ref.watch(SchoolSelectorNotifier.provider);
    final schools = ref.watch(DataProviders.school);
    ref.listen(
      DataProviders.school.future,
      (_, value) => {},
      onError: (error, stackTrace) => {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        )
      },
    );
    return schools.when(
      data: (schools) {
        return Column(
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
              // ignore: deprecated_member_use
              color: theme.accentColor,
              onPressed: () {
                final schoolSelPro = ref.read(SchoolSelectorNotifier.provider);
                final selectedSchool = schoolSelPro.school;
                if (selectedSchool != null) {
                  schoolSelPro.persistToDatabase();
                  Navigator.of(context).pushReplacementNamed("/section");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Pfft!.. Dumb human, Pick a school first."),
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
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (o, __) {
        return NetError(
          futurePro: DataProviders.school,
        );
      },
    );
  }
}
