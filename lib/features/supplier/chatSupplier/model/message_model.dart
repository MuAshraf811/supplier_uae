class MessageModelSupplier {
  final String message;
  final String time;
  final bool isSender;

  MessageModelSupplier({
    required this.message,
    required this.time,
    required this.isSender,
  });
  factory MessageModelSupplier.fromJson(Map<String, dynamic> response) {
    return MessageModelSupplier(
      message: response["message"],
      time: response["time"],
      isSender: response["isSender"],
    );
  }
}
