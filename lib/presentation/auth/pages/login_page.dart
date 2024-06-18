import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:possapp/core/components/buttins.dart';
import 'package:possapp/core/components/custom_text_field.dart';
import 'package:possapp/core/components/spaces.dart';
import 'package:possapp/data/datasource/auth_local_datasource.dart';
import 'package:possapp/presentation/auth/bloc/login/login_bloc.dart';
import 'package:possapp/presentation/note/pages/notes_screen.dart';
import 'package:possapp/screens/splash_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC700),
      body: Stack(
        children: [
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/human-1.png',
              width: 500, // Adjust the width as needed
              height: 730, // Adjust the height as needed
            ),
          ),
          Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40.0),
                        const Center(
                          child: Text(
                            'Simpleé',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(18, 41, 108, 1.0),
                            ),
                          ),
                        ),
                        const SpaceHeight(12.0),
                        const Center(
                          child: Text(
                            'Enter your account information to get started with Simpleé Note',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(31, 49, 106, 1),
                            ),
                          ),
                        ),
                        const SpaceHeight(40.0),
                        CustomTextField(
                          controller: emailController,
                          label: 'Email',
                          // prefixIcon: Icons.email,
                          // textInputType: TextInputType.emailAddress,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: passwordController,
                          label: 'Password',
                          // prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                        const SpaceHeight(24.0),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              success: (authResponseModel) {
                                AuthLocalDataSource().saveAuthData(authResponseModel);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LandingView(),
                                  ),
                                );
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                            LoginEvent.login(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    },
                                    label: 'Masuk',
                                  );
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
