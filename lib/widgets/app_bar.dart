import 'package:flutter/material.dart';

import '../utils/preferences.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('List of office'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () async {
            Preferences.removeLoggedOutStatus();
          },
        ),
      ],
    );
  }
}
