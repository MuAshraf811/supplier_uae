class MessageprodModelSupplier {
  final String message;
  final String time;
  final String userId;

  MessageprodModelSupplier( {
    required this.message,
    required this.time,
    required this.userId,
  });
  factory MessageprodModelSupplier.fromJson(Map<String, dynamic> response) {
    return MessageprodModelSupplier(
      message: response["message"]??"", 
      userId: response["userId"]??"",
      time: response["time"]??"",
    );
  } 
   Map<String, dynamic> toMap() {
    return {
      "message": message,
      "time": time,
      "userId": userId,
    };
  }
}
