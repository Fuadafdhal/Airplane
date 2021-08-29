import 'package:airplan/cubit/transaction_cubit.dart';
import 'package:airplan/shared/theme.dart';
import 'package:airplan/ui/widgets/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TransactionSuccess) {
          print('transactions.length : ${state.transactions.length}');
          if (state.transactions.length == 0) {
            return Center(
              child: Text('belum ada Transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                itemBuilder: (context, index) {
                  return TransactionCard(state.transactions[index]);
                });
          }
        }

        return Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
