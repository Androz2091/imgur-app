import 'package:flutter/material.dart';

import 'app-scale.dart';

class Utils {

  static getAppBar(BuildContext context, {bool canGoBack = true}) {
    AppScale scale = AppScale(context);

    return AppBar(
      title: Text('Visa'),
      toolbarHeight: scale.ofHeight(0.076),
      leading: canGoBack
          ? new IconButton(
              icon: new Icon(Icons.arrow_back, size: scale.ofHeight(0.033)),
              onPressed: () => Navigator.pop(context))
          : null,
      // elevation: 0,
      centerTitle: true,
    );
  }
}
