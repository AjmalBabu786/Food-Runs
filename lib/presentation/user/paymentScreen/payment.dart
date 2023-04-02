import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../core/colours/colours.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController paymentController = TextEditingController();
  final _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "asset/online paymen tr.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: 255,
                left: 40,
                child: Container(
                  height: 50,
                  width: 40,
                  child: Icon(
                    Icons.currency_rupee_sharp,
                    size: 40,
                    color: mWhite,
                  ),
                )),
            Positioned(
              top: 250,
              left: 80,
              child: SizedBox(
                height: 60,
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: paymentController,
                  cursorColor: mBlack,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: mtextfield,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: mBlack),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mBlack),
                    ),
                    hintText: 'Enter Amount',
                  ),
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 30,
              child: Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  "asset/head logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 105,
              left: 135,
              child: Text(
                "Paying FOOD RUNS",
                style: TextStyle(fontWeight: FontWeight.w800, color: mWhite),
              ),
            ),
            Positioned(
                top: 350,
                right: 140,
                child: Container(
                    height: 60,
                    width: 100,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: mContwhite),
                      child: Text(
                        "Pay",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mRed,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        var options = {
                          'key': 'rzp_test_mkzSidhb6RgmDG',
                          'amount': int.parse(paymentController.text) * 100,
                          'name': 'FOOD RUNS.',
                          'description': 'Demo',
                          'prefill': {
                            'contact': '9539368230',
                            'email': 'ajmalpkirivetty@gmail.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        _razorpay.open(options);
                        paymentController.clear();
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
// Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       var options = {
          //         'key': 'rzp_test_mkzSidhb6RgmDG',
          //         'amount': 500 * 100,
          //         'name': 'Gestapo Corp.',
          //         'description': 'Demo',
          //         'prefill': {
          //           'contact': '8138845540',
          //           'email': 'akmalmahmoodkinan@gmail.com'
          //         },
          //         'external': {
          //           'wallets': ['paytm']
          //         }
          //       };
          //       _razorpay.open(options);
          //     },
          //     child: Text("pay"),
          //   ),
          // ),