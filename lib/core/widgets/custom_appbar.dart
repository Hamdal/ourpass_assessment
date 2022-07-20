import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget getCustomAppBar(
  BuildContext context, 
  {
    List<Widget>? actions,
    String? title
  }
) {
  return AppBar(
    elevation: 0,
    title: Text(
      title ?? '', 
      style: const TextStyle(
        color: Colors.black87,
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