import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';

class GbuAgendaTitle extends StatelessWidget {
  const GbuAgendaTitle();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'GBU',
                  style: theme.textTheme.headline1
                      .copyWith(color: theme.accentColor),
                ),
                TextSpan(
                  text: 'Agenda',
                  style: theme.textTheme.headline1,
                ),
              ],
            ),
          ),
          Text(
            "A Schedule App for Gautam Buddha University that does’nt suck.",
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
