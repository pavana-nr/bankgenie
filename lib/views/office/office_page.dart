import 'package:bankgenie/controllers/office_bloc/office_bloc_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/office_bloc/office_bloc_bloc.dart';
import '../../controllers/office_bloc/office_bloc_events.dart';
import 'office_details.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  @override
  State<OfficePage> createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  final _searchTextController = TextEditingController();
  var officeDetails;
  String filter = '';
  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      print(_searchTextController.text);
      filter = _searchTextController.text;
      if (officeDetails.contains(filter.toLowerCase())) {
        print("search text exist");
      }
      setState(() {});
    });
    BlocProvider.of<OfficeBlocBloc>(context).add(const OfficeBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: BlocBuilder<OfficeBlocBloc, OfficeBlocState>(
      builder: (context, state) {
        if (state is OfficeBlocLoading) {
          return const CircularProgressIndicator();
        }
        if (state is OfficeBlocLoadedState) {
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(20.0),
                  child: const Text(
                    "List of office",
                    style: TextStyle(fontSize: 20.0),
                  )),
              TextField(
                onChanged: (value) {},
                controller: _searchTextController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  border: InputBorder.none,
                  hintText: 'search office',
                ),
              ),
              state.data.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfficeDetails(
                                      officeDetails: officeDetails)),
                            );
                          },
                          child: ListTile(
                            title: Text(state.data[index].name),
                            trailing: state.data[index].openingDate.length !=
                                    null
                                ? Text(
                                    "${state.data[index].openingDate[2]}/${state.data[index].openingDate[1]}/${state.data[index].openingDate[0]}")
                                : const Text("-"),
                          ),
                        );
                      })
                  : const SizedBox(child: Text("No data found!")),
            ],
          );
        }
        if (state is OfficeBlocError) {}
        return const SizedBox(child: Text("No data found!"));
      },
    )));
  }
}
