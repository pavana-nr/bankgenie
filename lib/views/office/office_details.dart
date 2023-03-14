import 'package:bankgenie/views/office/data_table_page.dart';
import 'package:flutter/material.dart';

class OfficeDetails extends StatefulWidget {
  const OfficeDetails({super.key, required this.officeDetails});
  final List officeDetails;
  @override
  State<OfficeDetails> createState() => _OfficeDetailsState();
}

class _OfficeDetailsState extends State<OfficeDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: MediaQuery.of(context).size.width < 560
                ? Column(
                    children: [
                      const Text(
                        "Office Details",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      widget.officeDetails.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.officeDetails.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(widget.officeDetails[index].id
                                      .toString()),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(widget.officeDetails[index].name
                                          .toString()),
                                      Text(widget
                                          .officeDetails[index].nameDecorated
                                          .toString()),
                                      widget.officeDetails[index].openingDate
                                                  .length !=
                                              0
                                          ? Text(
                                              "${widget.officeDetails[index].openingDate[2]}/${widget.officeDetails[index].openingDate[1]}/${widget.officeDetails[index].openingDate[0]}")
                                          : const Text("-"),
                                    ],
                                  ),
                                  trailing: Text(widget
                                      .officeDetails[index].externalId
                                      .toString()),
                                );
                              })
                          : const Center(child: Text("No details found!")),
                    ],
                  )
                : DataTablePage(officeDetails: widget.officeDetails)));
  }
}
