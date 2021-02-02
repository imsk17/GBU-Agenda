import 'package:GbuAgenda/ui/widgets/gbu_agenda_title.dart';

import 'package:GbuAgenda/utils/theme_data.dart';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/gbu.png',
                  scale: 2.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Hero(
                  tag: 'Title',
                  child: GbuAgendaTitle(),
                )
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
                    "Let's Get Started",
                    style: theme.textTheme.headline3,
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
