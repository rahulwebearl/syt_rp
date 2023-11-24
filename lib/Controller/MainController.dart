//
// import 'package:get/get.dart';
//
// import '../Api.dart';
// import '../models/Get_HomePage_Data_Modal.dart';
// import 'comman_dailog.dart';
//
// class MainController extends GetxController {
//   List<Get_HomePage_Data_Model> productData = [];
//   Map productDetails = {}.obs;
//
//   @override
//   void onReady() {
//     super.onReady();
//     fatchProductData();
//   }
//
//   Future<void> fatchProductData() async {
//     final List<DestinationData> loadedProduct = [];
//     CommanDialog.showLoading();
//     try {
//       final response = await HomePage_Data().HomePage_DataList();
//       CommanDialog.hideLoading();
//       response['message']['products'].forEach(
//
//       );
//       productData.assignAll(loadedProduct);
//       update();
//     } catch (error) {
//       CommanDialog.hideLoading();
//       CommanDialog.showErrorDialog();
//       print("ERROR11 $error");
//     }
//   }
//
//   // Future<void> getDetails(id) async {
//   //   print("fatchProduct $id");
//   //   var postData = {"productid": id};
//   //   productDetails = {};
//   //
//   //   try {
//   //     CommanDialog.showLoading();
//   //     final response =
//   //     await APICall().postRequest('/getproductdetails', postData);
//   //     CommanDialog.hideLoading();
//   //     if (response['code'] == 200) {
//   //       print("Got product");
//   //       Map dta = response['message']['productdet'];
//   //
//   //       productDetails.addAll(dta);
//   //       update();
//   //     } else if (response['code'] == 400) {
//   //
//   //       print("${response['code']}");
//   //     } else {}
//   //   } catch (error) {
//   //     CommanDialog.hideLoading();
//   //     print("ERROR11 $error");
//   //   }
//   // }
//
//   // Future<void> addTowishList(id) async {
//   //   print("fatchProduct $id");
//   //   var postData = {"productid": 1};
//   //   var index = productData.indexWhere((element) => element.id == id);
//   //   productData[index].favourite = !productData[index].favourite;
//   //   update();
//   //
//   //   try {
//   //     //getproductdetails
//   //     final response =
//   //     await APICall().postRequest('/wishlistproduct', postData);
//   //
//   //     if (response['code'] == 200) {
//   //       print("Added");
//   //     } else if (response['code'] == 400) {
//   //       productData[index].favourite = !productData[index].favourite;
//   //     } else {}
//   //   } catch (error) {
//   //     CommanDialog.showErrorDialog();
//   //     print("ERROR11 $error");
//   //   }
//   // }
//
//
// }
