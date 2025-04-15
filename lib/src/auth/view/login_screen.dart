import 'package:finch/core/widgets/custom_gradient_button.dart';
import 'package:finch/core/widgets/custom_loader.dart';
import 'package:finch/src/auth/bloc/auth_bloc.dart';
import 'package:finch/src/auth/bloc/auth_event.dart';
import 'package:finch/src/auth/bloc/auth_state.dart';
import 'package:finch/src/auth/view/register_screen.dart';
import 'package:finch/src/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginEvent(
              email,
              password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedIn) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Logged In successfully"),
                    ),
                  );
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeScreen(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Login with your email and password',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: emailController,
                            hintText: 'Email',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Minimum 6 characters';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),
                          CustomGradientButton(
                            onPressed: _login,
                            text: 'Login',
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?",
                                  style: TextStyle(color: Colors.white)),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const RegisterScreen(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Text("Register",
                                    style: TextStyle(color: Colors.redAccent)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (state is AuthLoading) CustomLoader(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
