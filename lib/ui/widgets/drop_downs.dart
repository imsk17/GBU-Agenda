import 'package:flutter/material.dart';
import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/utils/extensions.dart';
import 'package:gbuagenda/utils/text_theme.dart';

DropdownMenuItem<School> schoolDropDownTile(School e, BuildContext c) {
  return DropdownMenuItem<School>(
    value: e,
    child: SizedBox(
      width: MediaQuery.of(c).size.width * 0.65,
      child: Row(
        children: [
          Text(
            'School of ',
            style: textTheme.headline3,
          ),
          Flexible(
            child: Text(
              e.fullName,
              overflow: TextOverflow.ellipsis,
              style: textTheme.headline3.toAccent(),
            ),
          ),
        ],
      ),
    ),
  );
}

DropdownMenuItem<Section> sectionDropDownTile(Section s, BuildContext c) {
  return DropdownMenuItem<Section>(
    value: s,
    child: SizedBox(
      width: MediaQuery.of(c).size.width * 0.65,
      child: OverflowBar(
        children: [
          Text(
            "${s.programName} ",
            overflow: TextOverflow.ellipsis,
            style: textTheme.headline4,
          ),
          Text(
            s.sectionName.trim(),
            overflow: TextOverflow.ellipsis,
            style: textTheme.headline4.toAccent(),
          )
        ],
      ),
    ),
  );
}
