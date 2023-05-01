import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void handleSuccess(BuildContext context, String message) {
  final FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
  showTopSnackBar(
    context as OverlayState,
    CustomSnackBar.success(
      textStyle: context.fonts.bodyLarge!.copyWith(
        color: context.colours.onPrimaryContainer,
      ),
      message: message,
      backgroundColor: context.colours.primary,
    ),
  );
}

void handleHelp(BuildContext context, String message) {
  final FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
  showTopSnackBar(
    context as OverlayState,
    CustomSnackBar.info(
      textStyle: context.fonts.bodyLarge!.copyWith(
        color: context.colours.onPrimaryContainer,
      ),
      message: message,
      backgroundColor: context.colours.tertiary,
    ),
  );
}
