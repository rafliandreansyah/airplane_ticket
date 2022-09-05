import 'package:airplane_ticket/ui/pages/bonus_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/text_field_default.dart';
import 'package:flutter/material.dart';
import 'package:airplane_ticket/shared/theme.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _passwordVisible = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          controller: _fullNameController,
                          title: 'Full Name',
                          hintText: 'Enter your full name...',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldDefault(
                          controller: _hobbyController,
                          title: 'Hobby',
                          hintText: 'Enter your hobby...',
                        ),
                        const SizedBox(height: 30),
                        ButtonPrimary(
                          title: 'Get Started',
                          width: double.infinity,
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(BonusPage.routeName),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms and Conditions',
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
