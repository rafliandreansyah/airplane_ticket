import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/ui/pages/sign_up_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            } else if (state is AuthInitial) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SignUpPage.routeName, (route) => false);
            }
          },
          builder: (ctx, state) {
            if (state is AuthLoading) {
              return CircularProgressIndicator();
            }

            return ButtonPrimary(
              title: 'Logout',
              width: 200,
              onTap: () {
                context.read<AuthCubit>().signOut();
              },
            );
          },
        ),
      ),
    );
  }
}
