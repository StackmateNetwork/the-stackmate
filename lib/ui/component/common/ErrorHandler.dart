import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void handleError(BuildContext context, String message) {
  final FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
  showTopSnackBar(
    context as OverlayState,
    CustomSnackBar.error(
      textStyle: context.fonts.bodyLarge!.copyWith(
        color: context.colours.onBackground,
      ),
      message: message,
      backgroundColor: context.colours.error,
    ),
  );
}
