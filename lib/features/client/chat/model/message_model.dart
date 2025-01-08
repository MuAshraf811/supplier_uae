class MessageModel {
  final String message;
  final String time;
  final bool isSender;

  MessageModel({
    required this.message,
    required this.time,
    required this.isSender,
  });
  factory MessageModel.fromJson(Map<String, dynamic> response) {
    return MessageModel(
      message: response["message"],
      time: response["time"],
      isSender: response["isSender"],
    );
  }
}
