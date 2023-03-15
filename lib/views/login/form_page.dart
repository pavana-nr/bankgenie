import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/login_bloc/login_bloc_bloc.dart';
import '../../controllers/login_bloc/login_bloc_events.dart';
import '../../widgets/button.dart';
import 'custom_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: "admin");
    passwordController = TextEditingController(text: "password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log-in",
                style: TextStyle(fontSize: 30),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, right: 8.0, bottom: 16.0),
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: usernameController,
                              hintText: 'Username',
                              validator: (val) {
                                if (val!.isEmpty) return 'Enter username';
                                return null;
                              },
                            ),
                            CustomFormField(
                              controller: passwordController,
                              hintText: 'Password',
                              isPassword: true,
                              validator: (val) {
                                if (val!.isEmpty) return 'Enter  password';
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PrimaryButton(
                        onPressed: () => _onLoginPressed(), title: "Login")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      debugPrint(usernameController.text + passwordController.text);
      BlocProvider.of<LoginBlocBloc>(context).add(LoginBlocEvent(
          username: usernameController.text,
          password: passwordController.text));
    }
  }
}
