import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'networking.dart';
import 'customWidget.dart';

int fecthedValueForBTC = 0;
int fecthedValueForETH = 0;
int fecthedValueForLTC = 0;

const apikey = '728A7E60-5F67-40EF-9A1C-01544D13080F';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String startingValue = 'USD';
  String valueForBTC = '?';
  String valueForETH = '?';
  String valueForLTC = '?';

  Future currencyGet() async {
    try {
      var dataOfBTC =
          await Networking(currencyType: startingValue, bitCoinType: 'BTC')
              .getCoinValue();

      var dataOfETH =
          await Networking(currencyType: startingValue, bitCoinType: 'ETH')
              .getCoinValue();

      var dataOfLTC =
          await Networking(currencyType: startingValue, bitCoinType: 'LTC')
              .getCoinValue();

      setState(() {
        valueForBTC = dataOfBTC['rate'].toString();
        valueForETH = dataOfETH['rate'].toString();
        valueForLTC = dataOfLTC['rate'].toString();
        // fecthedValueForBTC = valueForBTC.toInt();
        // fecthedValueForETH = valueForETH.toInt();
        // fecthedValueForLTC = valueForLTC.toInt();
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropDown() {
    return DropdownButton<String>(
      value: startingValue,
      items: currenciesList.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) async {
        await currencyGet();
        setState(() {
          startingValue = value!;
        });
      },
    );
  }

  CupertinoPicker ISOPicker() {
    List<Text> itemList = [];
    for (String value in currenciesList) {
      itemList.add(Text(value));
    }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {},
        children: itemList);
  }

  @override
  // void initState() {
  //   currencyGet();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyWidget(
                  fecthedValue: valueForBTC,
                  startingValue: startingValue,
                  bitCoinType: 'BTC'),
              MyWidget(
                  fecthedValue: valueForETH,
                  startingValue: startingValue,
                  bitCoinType: 'ETH'),
              MyWidget(
                  fecthedValue: valueForLTC,
                  startingValue: startingValue,
                  bitCoinType: 'LTC'),
            ],
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? ISOPicker() : androidDropDown()),
        ],
      ),
    );
  }
}
