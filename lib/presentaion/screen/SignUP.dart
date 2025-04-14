import 'package:animate_do/animate_do.dart';
import 'package:devloper_app/business_logic/cubit/auth_cubit.dart';
import 'package:devloper_app/business_logic/cubit/auth_state.dart';
import 'package:devloper_app/presentaion/screen/widget/custom_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/auth.dart';
import 'widget/custom_field.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 158, 207),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "Join us today",
                          style: TextStyle(
                            color: Color(0xff4A154B),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Create your\naccount",
                        style: TextStyle(
                          color: Color(0xff1D1C1D),
                          fontSize: 36,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInDown(
                        duration: const Duration(milliseconds: 650),
                        delay: const Duration(milliseconds: 200),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomField(
                                controller: emailController,
                                icon: CupertinoIcons.mail,
                                gradientColors: const [
                                  Color(0xFF4A154B),
                                  Color(0xFF6B1A6B)
                                ],
                                hint: "Email",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomField(
                                controller: usernameController,
                                icon: CupertinoIcons.person,
                                gradientColors: const [
                                  Color(0xFF4A154B),
                                  Color(0xFF6B1A6B)
                                ],
                                hint: "Username",
                                isPassword: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a username';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomField(
                                controller: passwordController,
                                icon: CupertinoIcons.lock,
                                gradientColors: const [
                                  Color(0xFF4A154B),
                                  Color(0xFF6B1A6B)
                                ],
                                hint: "Password",
                                isPassword: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomField(
                                controller: confirmPasswordController,
                                icon: CupertinoIcons.lock_rotation_open,
                                gradientColors: const [
                                  Color(0xFF4A154B),
                                  Color(0xFF6B1A6B)
                                ],
                                hint: "Confirm Password",
                                isPassword: true,
                                validator: (value) {
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Sign Up Successful!")),
                      );
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)), //
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 26),
                        FadeInDown(
                          delay: const Duration(milliseconds: 600),
                          duration: const Duration(milliseconds: 400),
                          child: state is AuthLoading
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    context.read<AuthCubit>().signUp(
                                          AuthModel(
                                            email: emailController.text,
                                            username: usernameController.text,
                                            password: passwordController.text,
                                          ),
                                          email: emailController.text,
                                          username: usernameController.text,
                                          password: passwordController.text,
                                        );
                                  },
                                  text: "Sign up",
                                ),
                        ),
                      ],
                    );
                  },
                ),
                
                const SizedBox(height: 30),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.transparent,
                                  Color(0xffe0e0e0)
                                ]),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'or continue with',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF4A154B)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.transparent,
                                  Color(0xffe0e0e0)
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                              icon: EvaIcons.github,
                              label: "GitHub",
                              gradientColors: [Colors.black12, Colors.black]),
                          const SizedBox(width: 60),
                          _buildSocialButton(
                              icon: EvaIcons.linkedin,
                              label: "LinkedIn",
                              gradientColors: [Colors.blue, Colors.blueAccent]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      {required IconData icon,
      required String label,
      required List<Color> gradientColors}) {
    return Container(
      height: 55,
      width: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColors[0].withOpacity(0.1),
            gradientColors[1].withOpacity(0.1)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: gradientColors[1]),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  color: gradientColors[1], fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
