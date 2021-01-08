import 'package:GbuAgenda/utils/theme_data.dart';
import 'package:flutter/material.dart';

class ErrorSnackbar extends StatelessWidget {
  final String message;
  const ErrorSnackbar({this.message});
  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: theme.textTheme.headline6.copyWith(fontSize: 15),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      backgroundColor: Colours.error,
    );
  }
}
