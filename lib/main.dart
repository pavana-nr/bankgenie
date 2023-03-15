import 'package:bankgenie/controllers/login_bloc/login_bloc_bloc.dart';
import 'package:bankgenie/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/office_bloc/office_bloc_bloc.dart';
import 'views/login/login_page.dart';
import 'views/office/office_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlocBloc>(
          create: (context) => LoginBlocBloc(),
        ),
        BlocProvider<OfficeBlocBloc>(
          create: (context) => OfficeBlocBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: _initialRoute(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/officePage': (context) => const OfficePage()
        },
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      ),
    );
  }

  String _initialRoute() {
    return Preferences.getLoggedInStatus() ? "/officePage" : "/login";
  }
}
