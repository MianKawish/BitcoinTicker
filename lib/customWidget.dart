import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget(
      {super.key,
      required this.fecthedValue,
      required this.startingValue,
      required this.bitCoinType});
  final String fecthedValue;
  final String startingValue;
  final String bitCoinType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $bitCoinType = $fecthedValue $startingValue',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
