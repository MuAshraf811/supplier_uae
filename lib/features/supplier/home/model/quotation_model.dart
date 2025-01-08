
class QuotationModel {
  final String quotationDescription;
  final String quantity;
  final String rate;
  final String amount;
  final String vat;
  final String total;
  final String orderNumber;
  final String quotationDate;
  final String supplierId;
  final String supplierName;
   final String email; 
final String mobile; 
final String city;
  QuotationModel( 
      {required this.quotationDescription,
      required this.quantity,
      required this.rate,
      required this.amount, 
    required  this.email,required this.mobile,required this.city,
      required this.vat,
      required this.total,
      required this.orderNumber,
      required this.quotationDate,
      required this.supplierId,
      required this.supplierName});

  factory QuotationModel.fromJson(Map<String, dynamic> res) {
    return QuotationModel(
        quotationDescription: res["quotationDescription"]??"",
        quantity: res["quantity"],
        rate: res["rate"]??"",
        amount: res["amount"]??"",
        vat: res["vat"]??"", 
        mobile: res["mobile"]??"", 
     city: res["city"]??"", 
     email: res["email"]??"",
        total: res["total"]??"",
        orderNumber: res["orderNumber"]??"",
        quotationDate:res["quotationDate"]??"",
        supplierId: res["supplierId"]??"",
        supplierName: res["supplierName"]??"");
  }
}
