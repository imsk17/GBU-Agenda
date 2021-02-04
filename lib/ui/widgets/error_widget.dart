import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class NetError extends StatelessWidget {
  final FutureProvider futurePro;

  const NetError({this.futurePro});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.network_check_outlined,
          color: Colours.error,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Your internet connection is Trash.\n Consider Upgrading Lol.",
            style: theme.textTheme.headline6.copyWith(color: Colours.error),
            textAlign: TextAlign.center,
          ),
        ),
        MaterialButton(
          onPressed: () {
            context.refresh(futurePro);
          },
          color: theme.accentColor,
          child: Text(
            "Retry",
            style: theme.textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
