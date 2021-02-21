import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/extensions.dart';
import '../../utils/theme_data.dart';

class GbuAgendaTitle extends StatelessWidget {
  const GbuAgendaTitle();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'GBU ',
                style: theme.textTheme.headline1.toAccent(),
              ),
              TextSpan(
                text: 'Agenda',
                style: theme.textTheme.headline1,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "A Schedule App for Gautam Buddha University that does’nt suck.",
          style: theme.textTheme.headline3,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
