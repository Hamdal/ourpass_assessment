import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget getCustomAppBar(
  BuildContext context, 
  {
    List<Widget>? actions
  }
) {
  return AppBar(
    elevation: 0,
    titleSpacing: 0.0,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
       Icons.arrow_back_ios
      )
    ),
    iconTheme: Theme.of(context).iconTheme.copyWith(
      color: Theme.of(context).brightness == Brightness.dark
      ? Colors.white : Colors.black,
    ),
    systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
      ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    actions: actions
  );
}