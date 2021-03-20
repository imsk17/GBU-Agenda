import 'package:gbuagenda/models/class.dart';
import 'package:gbuagenda/ui/widgets/chips.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:gbuagenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import '../../utils/extensions.dart';

class ClassCard extends StatelessWidget {
  final Class _class;

  const ClassCard(this._class);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colours.lightScaffold,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        splashColor: Colours.accent,
        onTap: () {
          Navigator.pushNamed(context, "/class", arguments: _class);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.headline4
                          .copyWith(fontWeight: FontWeight.bold),
                      text: _class.subject.name,
                      children: [
                        TextSpan(
                          style: theme.textTheme.headline4
                              .toAccent()
                              .copyWith(fontWeight: FontWeight.bold),
                          text: " (${_class.subject.code})",
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              child: Icon(
                                _class.room.isLab == 0
                                    ? Icons.book
                                    : Icons.thermostat_rounded,
                                color: theme.accentColor,
                              ),
                            ),
                            ClassChip(text: _class.room.name),
                            ClassChip(text: "G-${_class.batch}"),
                            ClassChip(text: _class.teacher.abbr.toUpperCase()),
                          ],
                        ),
                        Text(
                          kClassTimingsMap[_class.period],
                          style: theme.textTheme.headline5
                              .copyWith(color: Colours.timing),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
