import 'package:bankgenie/controllers/office_bloc/office_bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/office_bloc/office_bloc_bloc.dart';
import '../../controllers/office_bloc/office_bloc_events.dart';
import '../../models/office_model/office.dart';
import '../../utils/preferences.dart';
import 'office_details.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  @override
  State<OfficePage> createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OfficeBlocBloc>(context).add(const OfficeBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    final officeBloc = BlocProvider.of<OfficeBlocBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: _renderAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<OfficeBlocBloc, OfficeBlocState>(
            builder: (context, state) {
              if (state is OfficeBlocLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is OfficeBlocLoadedState) {
                return _searchArea(state, officeBloc);
              } else if (state is OfficeBlocError) {
                return _noDataFound();
              }
              return Container();
            },
          ),
        ),
      ),
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

  Widget _searchArea(OfficeBlocLoadedState state, OfficeBlocBloc officeBloc) {
    return Column(
      children: [
        TextField(
          onChanged: (query) => onSearch(query, state),
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
            ? _listViewBuilder(state)
            : const SizedBox(child: Text("No data found!")),
      ],
    );
  }

  onSearch(String query, OfficeBlocLoadedState state) {
    var filtered =
        state.data.where((element) => element.name!.contains(query)).toList();
  }

  ListView _listViewBuilder(OfficeBlocLoadedState state) {
    return ListView.builder(
      itemCount: state.data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Office currentItem = state.data[index];
        return GestureDetector(
          onTap: () => _naviagetToDetails(office: currentItem),
          child: ListTile(
            title: Text(currentItem.name ?? ""),
            subtitle: Text(currentItem.openingDate.reversed.join(" / ")),
            leading: const Icon(Icons.business_outlined),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        );
      },
    );
  }

  Widget _noDataFound() {
    return const Center(child: SizedBox(child: Text("Opps! No data found!")));
  }

  void _naviagetToDetails({required Office office}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OfficeDetails(officeDetails: office)),
    );
  }
}
