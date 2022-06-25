import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/utils/colours.dart';
import 'package:gbuagenda/utils/theme_data.dart';

class NetError extends ConsumerWidget {
  final FutureProvider? futurePro;

  const NetError({this.futurePro});
  @override
  Widget build(BuildContext context, ref) {
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
            style: theme.textTheme.headline6!.copyWith(color: Colours.error),
            textAlign: TextAlign.center,
          ),
        ),
        MaterialButton(
          onPressed: () {
            ref.refresh(futurePro!);
          },
          // ignore: deprecated_member_use
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
