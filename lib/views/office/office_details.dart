import 'package:flutter/material.dart';

import '../../utils/preferences.dart';
import '../../models/office_model/office.dart';

class OfficeDetails extends StatelessWidget {
  const OfficeDetails({super.key, required this.officeDetails});

  static Page page(Office office) {
    return MaterialPage<void>(
      child: OfficeDetails(officeDetails: office),
    );
  }

  final Office officeDetails;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _renderAppBar(),
          body: MediaQuery.of(context).size.width < 560
              ? Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _renderRowItem(
                              title: "ID", value: officeDetails.id.toString()),
                          _renderRowItem(
                              title: "External ID",
                              value: officeDetails.externalId.toString()),
                          _renderRowItem(
                              title: "Name", value: officeDetails.name ?? ""),
                          _renderRowItem(
                              title: "Surname",
                              value: officeDetails.nameDecorated ?? ""),
                        ],
                      ),
                    ),
                  ),
                )
              : null),
    );
  }

  Row _renderRowItem({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(title)),
        const Text(" : "),
        Expanded(child: Text(value)),
      ],
    );
  }

  AppBar _renderAppBar() {
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
