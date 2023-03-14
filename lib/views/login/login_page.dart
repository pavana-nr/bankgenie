import 'package:bankgenie/controllers/login_bloc/login_bloc_bloc.dart';
import 'package:bankgenie/controllers/login_bloc/login_bloc_states.dart';
import 'package:bankgenie/views/office/office_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<LoginBlocBloc, LoginBlocState>(
        builder: (context, state) {
          if (state is LoginBlocLoadedState) {
            Future.delayed(Duration.zero, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OfficePage()),
              );
            });
          }
          if (state is LoginBlocError) {
            Future.delayed(Duration.zero, () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.e.toString())));
            });
          }
          if (state is LoginBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const FormPage();
        },
      )),
    );
  }
}
