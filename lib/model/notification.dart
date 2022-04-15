import 'dart:convert';

class Notification {
  int? id;
  String? title;
  String? body;
  String? icon;
  String? date;

  Notification({
    this.id,
    this.title,
    this.body,
    this.icon,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'icon': icon,
      'date': date,
    };
  }

  factory Notification.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Notification();

    return Notification(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      icon: map['icon'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));
}

final notifications = [
  Notification(
    title: 'New Update',
    body: 'Video call available.',
    icon: 'assets/images/reminder.png',
    date: '2h',
  ),
  Notification(
    title: 'Study Tips',
    body: 'Reading is great practice, but you also need to listen.',
    icon: 'assets/images/tip.png',
    date: '1d',
  ),
  Notification(
    title: 'Good News!',
    body: 'You earned 3 days premium',
    icon: 'assets/images/confirmation.png',
    date: '1d',
  ),
  Notification(
    title: 'Caution!',
    body: 'Prohibited the use of offensive language',
    icon: 'assets/images/reminder.png',
    date: '1 week',
  ),
  Notification(
    title: 'New Update',
    body: 'Call and messages available.',
    icon: 'assets/images/reminder.png',
    date: '1 week',
  ),
];
