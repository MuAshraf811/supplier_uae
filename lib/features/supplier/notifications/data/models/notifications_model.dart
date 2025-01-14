
class NotificationModel {
  final String title;
  final String body;
  final String? date;


  NotificationModel({
    required this.title,
    required this.body,
    this.date,
});

  factory NotificationModel.fromJson(Map<String,dynamic> json){

    return NotificationModel(
        title: json['title'],
        body: json['body'],
        date: json['date']??"00:00:00 ",
    );
  }

  // String get date => this.data
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'date': date
    };
  }
}