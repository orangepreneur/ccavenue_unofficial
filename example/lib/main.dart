import 'package:flutter/material.dart';

import 'package:ccavenue_unofficial/ccavenue_unofficial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ccavenue = CcavenueUnofficial();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Intiate Payment"),
            onPressed: () {
              _ccavenue.initiatePayment(
                  transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
                  accessCode: 'AVGJ72KE14CN51JGNC',
                  amount: '1',
                  cancelUrl: 'http://127.0.0.1:3001/ccavResponseHandler',
                  currencyType: 'INR',
                  merchantId: '2510801',
                  orderId: '2344',
                  redirectUrl: 'http://127.0.0.1:3001/ccavResponseHandler',
                  rsaKeyUrl:
                      'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp');
            },
          ),
        ),
      ),
    );
  }
}
