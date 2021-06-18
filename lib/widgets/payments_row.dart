import 'package:flutter/material.dart';

class PaymentRow extends StatelessWidget {

  final String title, amount;

  const PaymentRow({Key? key, required this.title, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(title),
        Expanded(child: SizedBox()),
        Text(amount),
      ],
    );
  }
}
