import 'package:GbuAgenda/ui/widgets/gbu_agenda_title.dart';
import 'package:GbuAgenda/ui/widgets/made_by.dart';
import 'package:GbuAgenda/utils/colours.dart';

import 'package:GbuAgenda/utils/theme_data.dart';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/gbu.png',
                scale: 2.75,
              ),
              const GbuAgendaTitle(),
            ],
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                "/school",
              );
            },
            color: Colours.accent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Let's Dive In",
                  style: theme.textTheme.headline3,
                ),
                const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: MadeByMe(),
    );
  }
}
