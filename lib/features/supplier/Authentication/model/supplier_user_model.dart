class SupplierUserModel { 


  // this is the main data supplier must provide to complete his registeration
  final String email;
  final String mobile;
  final String city;
  final String companyName;
  final String taxNumber;
  final String bankName;
  final String ipanNumber;
  final String imagePath;
  final String uuid;
  final String approved;

  SupplierUserModel(
      {required this.email,
      required this.mobile,
      required this.city,
      required this.imagePath, 
      required this.companyName,
      required this.taxNumber,
        required this.bankName,
        required this.uuid,
        required this.approved,
      required this.ipanNumber});

      // this is factory constructor to convert firebase response to dart model 
      factory SupplierUserModel.fromJson(Map<String, dynamic> json) {
        String phoneKey = json['mobile'] != null ? 'mobile' : 'mobile_number';
    return SupplierUserModel(
      email: json['email'],
      mobile: json[phoneKey],
      imagePath: json["imagePath"]??"",
      city: json['city'],
      companyName: json['companyName']??"",
      taxNumber: json['taxNumber']??"",
      bankName: json['bankName']??"",
      ipanNumber: json['ipanNumber']??"",
      uuid: json['uuid'],
      approved: json['approved']??"FALSE"
    );
  }

  // Method to convert the instance to a Map
  Map<String, dynamic> toMap(String fcmToken,String notiHistory) {
    return {
      'email': email,
      'mobile': mobile,
      'imagePath': imagePath,
      'city': city,
      'companyName': companyName,
      'taxNumber': taxNumber,
      'bankName': bankName,
      'ipanNumber': ipanNumber,
      'uuid': uuid,
      "approved": "FALSE",
      "fcmToken":"",
      "notificationHistory":""
    };
  }
}
