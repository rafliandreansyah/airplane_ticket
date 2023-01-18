import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/service/destination_service.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/pages/sign_up_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/text_field_default.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const String routeName = '/sign-in';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainPage.routeName,
              (route) => false,
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: colorRed,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ButtonPrimary(
              title: 'Sign In',
              width: double.infinity,
              onTap: () {
                context.read<AuthCubit>().signIn(
                    _emailController.text.toString(),
                    _passwordController.text.toString());
              });
        },
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join us and get\nyour next journey',
                  style: blackText.copyWith(
                    fontSize: 24,
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        TextFieldDefault(
                          controller: _emailController,
                          title: 'Email',
                          hintText: 'Enter your email...',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldDefault(
                          controller: _passwordController,
                          title: 'Password',
                          obscureText: !_passwordVisible,
                          hintText: 'Enter your password...',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        const SizedBox(height: 30),
                        submitButton(),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(SignUpPage.routeName);
                    },
                    child: Text(
                      'Don\'t have an account? Sign Up',
                      style: greyText.copyWith(
                        fontSize: 16,
                        fontWeight: fontWeightLight,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
