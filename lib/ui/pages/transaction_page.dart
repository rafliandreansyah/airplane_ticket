import 'package:airplane_ticket/cubit/transaction_cubit.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/transaction_item.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            return ListView.builder(
                padding: EdgeInsets.all(defaultMargin),
                itemCount: state.list.length,
                itemBuilder: (ctx, index) =>
                    TransactionItem(state.list[index]));
          } else if (state is TransactionFailed) {
            return Center(
              child: Text('error get data: ${state.error}'),
            );
          }
          return const Center(
            child: Text('Transaction Page'),
          );
        },
      ),
    );
  }
}
