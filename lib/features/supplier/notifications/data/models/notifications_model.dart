
class NotificationModel {
  final String title;
  final String body;
  final String? date;
  final String? offerSupplierId;


  NotificationModel({
    required this.title,
    required this.body,
    this.date,
    this.offerSupplierId,
});

  factory NotificationModel.fromJson(Map<String,dynamic> json){

    return NotificationModel(
        title: json['title'],
        body: json['body'],
      date: json['data']!=null? json['data']['date']: "00:00:00 ",
      offerSupplierId: json['data']!=null?json['data']['offerSupplierId']:null,
    );
  }

  // String get date => this.data
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'data': {
        "offerSupplierId":offerSupplierId??"",
        'date': date,
      },
    };
  }
}