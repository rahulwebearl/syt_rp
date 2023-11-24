// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// import '../../main.dart';

// class payment extends StatefulWidget {

//   String name,email,phoneNo,agencyprice;

//   payment(this.name,this.email,this.phoneNo,this.agencyprice, {Key? key}): super(key: key);

//   @override
//   State<payment> createState() => _paymentState();
// }

// class _paymentState extends State<payment> {


//   static const platform = const MethodChannel("razorpay_flutter");

//   late Razorpay _razorpay;
// int total = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Razorpay'),
//         ),
// body:

//     Center(
//     child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ElevatedButton(onPressed: openCheckout, child: Text('Open'))
//         ])),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     openCheckout();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_live_ILgsfZCZoFIKMb',
//       'amount':num.parse(widget.agencyprice)*100,
//       'name': 'StartYourTour',
//       'description': 'payment',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '${widget.phoneNo}', 'email': '${widget.email}'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print('Success Response: $response');
//     Fluttertoast.showToast(
//         msg: "SUCCESS: " + response.paymentId.toString(),
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('Error Response: $response');
//     Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " + response.message.toString(),
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print('External SDK Response: $response');
//     Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName.toString(),
//         toastLength: Toast.LENGTH_SHORT);
//   }
// }