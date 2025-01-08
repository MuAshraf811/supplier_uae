class ClientOrderModel {
  final String orderName;
  final String orderDetails;
  final String orderDescription;
  final String orderDate;
  final String userId;
  final String orderId; 
  final String category;
 // final String email;
 // final String mobile;
 // final String name;
 // final String address;

  ClientOrderModel(
      {required this.orderName, 
      required this.category,
      required this.userId,
     // required this.address,
      required this.orderId,
      //required this.email,
      //required this.mobile,
    //  required this.name,
      required this.orderDetails,
      required this.orderDescription,
      required this.orderDate});

  factory ClientOrderModel.fromJson(Map<String, dynamic> res) {
    return ClientOrderModel(
      orderId: res["id"] ?? '', 
      category: res['category']??"",
     // email: res["email"] ?? '',
     // address: res["address"],
     // mobile: res["mobile"] ?? '',
     // name: res["name"] ?? '',
      userId: res["userId"] ?? '',
      orderName: res["orderType"] ?? '',
      orderDetails: res["details"] ?? '',
      orderDescription: res["extra_etails"] ?? '',
      orderDate: res["date"] ?? "",
    );
  }
}
