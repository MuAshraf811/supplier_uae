class MessageprodModel {
  final String message;
  final String time;
  final String userId;

  MessageprodModel( {
    required this.message,
    required this.time,
    required this.userId,
  });
  factory MessageprodModel.fromJson(Map<String, dynamic> response) {
    return MessageprodModel(
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
