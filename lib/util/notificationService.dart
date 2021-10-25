import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Singleton Object
  static final NotificationService _notifyService =
      NotificationService._internal();

  factory NotificationService() {
    return _notifyService;
  }

  NotificationService._internal();

  static const channelID = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<dynamic> init() async {
    final AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings intiSettingsIOS = IOSInitializationSettings(
        requestSoundPermission: false,
        requestAlertPermission: false,
        requestBadgePermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initSettingsAndroid, iOS: intiSettingsIOS, macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails('channel ID', 'channelName',
          playSound: true, importance: Importance.high);

  // TO show live and local notification
  Future<void> showNotifications() async {
    // String title, String body
    await flutterLocalNotificationsPlugin.show(
        0,
        "Big Billion Day Offer",
        "Congrats!, Explore more number of offers in the big billion day!...",
        // '$title', '$body',
        NotificationDetails(android: _androidNotificationDetails));
  }

  // TO show live and local notification
  Future<void> showDynamicNotifications(
      int id, String title, String desc) async {
    // String title, String body
    await flutterLocalNotificationsPlugin.show(
        id,
        title,
        desc,
        // '$title', '$body',
        NotificationDetails(android: _androidNotificationDetails));
  }

  // TO show live and local notification
  Future<void> scheduledNotifications() async {
    // String title, String body
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Scheduled Notification!",
        "Holla!, Notification Pushed after 5 seconds...Explore more......",
        // id, '$title', '$body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  // Cancel Notification
  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancel All Notification
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future<dynamic> selectNotification(String payload) async {
  // Logic
}

