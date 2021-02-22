import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/utils/text_theme.dart';
import 'package:flutter/material.dart';
import '../../utils/extensions.dart';

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
