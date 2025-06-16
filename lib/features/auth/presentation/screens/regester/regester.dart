
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_states.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/blocEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth_bloc/auth_bloc.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/custom_Button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Check your email to verify")),
          );
          Navigator.pushReplacementNamed(context, "login");
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                    Image.asset("assets/logo.png", width: width * 0.4),
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

                    SizedBox(height: height * 0.025),

                    CustomTextField(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Repeat Password',
                      controller: _repeatPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password again';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: height * 0.04),

                    // BlocBuilder فقط على الزرار
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: state is AuthLoading ? "Loading..." : "Sign Up",
                          onPressed: state is AuthLoading
                              ? (){}
                              : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                RegisterEvent(
                                   _emailController.text,
                                   _passwordController.text,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),

                    SizedBox(height: height * 0.03),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      },
                      child: const Text(
                        'Already have an account',
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
