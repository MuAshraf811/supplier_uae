class OrderModel {
  final String orderCategoryName;
  final String orderType;
  final String orderDate;
  final String orderDetails;
  final String? orderExtraDescription;
  OrderModel({
    required this.orderCategoryName,
    required this.orderType,
    required this.orderDate,
    required this.orderDetails,
     this.orderExtraDescription = " No Extra Details ",
  }); 


  @override
  String toString() {
    
    return "$orderCategoryName - $orderDetails - $orderDate";
  }
}
