// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:syt/screens/homeScreen.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// import '../../Base Url.dart';

// class PaymentScreen extends StatefulWidget {
//   String addressID;

//   String customerID;

//   PaymentScreen({required this.addressID, required this.customerID});

//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   late String selectedUrl;
//   double value = 0.0;
//   bool _isLoading = true;
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//   late WebViewController controllerGlobal;

//   @override
//   void initState() {
//     super.initState();
//     selectedUrl =
//         '${LURL}/customer/payment-mobile?customer_id=${widget.customerID}&address_id=${widget.addressID}';
//     print(selectedUrl);

//     // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _exitApp(context),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         body: Column(
//           children: [
//             //  CustomAppBar(title: getTranslated('PAYMENT', context), onBackPressed: () => _exitApp(context)),

//             Expanded(
//               child: Stack(
//                 children: [
//                   // WebView(
//                   //     javascriptMode: JavascriptMode.unrestricted,
//                   //     initialUrl: selectedUrl,
//                   //     gestureNavigationEnabled: true,
//                   //     userAgent:
//                   //         'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
//                   //     onWebViewCreated: (WebViewController webViewController) {
//                   //       _controller.future
//                   //           .then((value) => controllerGlobal = value);
//                   //       _controller.complete(webViewController);
//                   //     },
//                   //     onPageStarted: (String url) {
//                   //       if (url.contains(LURL)) {
//                   //         bool _isSuccess = url.contains('success');
//                   //         bool _isFailed = url.contains('fail');
//                   //         print('Page started loading: $url');
//                   //         setState(() {
//                   //           _isLoading = true;
//                   //         });
//                   //         if (_isSuccess) {
//                   //           Navigator.of(context).pushAndRemoveUntil(
//                   //               MaterialPageRoute(builder: (_) => HomeScreen()),
//                   //               (route) => false);
//                   //         } else if (_isFailed) {
//                   //           Navigator.of(context).pushAndRemoveUntil(
//                   //               MaterialPageRoute(builder: (_) => HomeScreen()),
//                   //               (route) => false);
//                   //         }
//                   //       }
//                   //     }),
//                   _isLoading
//                       ? Center(
//                           child: CircularProgressIndicator(
//                               color: Theme.of(context).primaryColor),
//                         )
//                       : SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<bool> _exitApp(BuildContext context) async {
//     if (await controllerGlobal.canGoBack()) {
//       controllerGlobal.goBack();
//       return Future.value(false);
//     } else {
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);

//       return Future.value(true);
//     }
//   }
// }
