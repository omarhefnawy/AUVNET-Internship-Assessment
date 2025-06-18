
import 'package:auvent_intership/core/network/local/cache_helper/cache_helper.dart';
import 'package:auvent_intership/features/auth/presentation/widgets/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../admin/prsentation/screens/admin.dart';
import '../../auth_bloc/auth_bloc.dart';
import '../../auth_bloc/auth_states.dart';
import '../../auth_bloc/blocEvent.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/custom_Button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state)async {
            ScaffoldMessenger.of(context).clearSnackBars();
            if (state is LoginSuccess) {
              print(state.user);
              await CacheHelper.setData(key: "login", value: true);
              ScaffoldMessenger.of(context).showSnackBar(
               CustomSnackBar(context, Colors.orangeAccent,"login success"),
              );
              //
              Future.delayed(Duration.zero, () {
                Navigator.pushNamed(context, "home");
              });
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message),backgroundColor: Colors.red,),
              );
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: height * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),

                      Image.asset(
                        "assets/images/logo.png",
                        width: width * 0.4,
                      ),

                      SizedBox(height: height * 0.06),

                      CustomTextField(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: height * 0.025),

                      CustomTextField(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: height * 0.04),

                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            text: 'Log in',
                            onPressed: state is AuthLoading
                                ? (){}
                                : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                   _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 5,),
                      CustomButton(text: "admin", onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomeScreen(),));
                      },),

                      SizedBox(height: height * 0.03),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "signUp");
                        },
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            color: Color(0xff1877F2),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
