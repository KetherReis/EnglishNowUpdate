import 'package:englishnow/pages/profile/widgets/info_widget.dart';
import 'package:englishnow/pages/visit/friends_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:englishnow/pages/call/audio/dial_screen.dart';
import 'package:englishnow/pages/call/video/audio_call_with_image_screen.dart';

import '../pages/friend/friend_profile_page.dart';
import '../pages/friend/my_friend_list_page.dart';
import '../pages/home/home.dart';
import '../pages/language/change_laguage_page.dart';
import '../pages/login/login_page.dart';
import '../pages/messages/messages_detail_page.dart';
import '../pages/notifications/notification_settings_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/profile/edit_profile_page.dart';
import '../pages/splash_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => SplashPage());

      case Routes.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());

      case Routes.home:
        return CupertinoPageRoute(builder: (_) => Home());

      case Routes.chatDetail:
        return CupertinoPageRoute(builder: (_) => MessagesDetailPage());

      case Routes.doctorProfile:
        return CupertinoPageRoute(builder: (_) => FriendProfilePage());

      case Routes.editProfile:
        return CupertinoPageRoute(builder: (_) => EditProfilePage());

      case Routes.changeLanguage:
        return CupertinoPageRoute(builder: (_) => ChangeLanguagePage());

      case Routes.notificationSettings:
        return CupertinoPageRoute(builder: (_) => NotificationSettingsPage());

      case Routes.myDoctors:
        return CupertinoPageRoute(builder: (_) => MyFriendListPage());

      case Routes.dialScreen:
        return CupertinoPageRoute(builder: (_) => DialScreen());

      case Routes.videoCall:
        return CupertinoPageRoute(builder: (_) => AudioCallWithImage());

      case Routes.searchFriend:
        return CupertinoPageRoute(builder: (_) => ProductCard());

      case Routes.notifications:
        return CupertinoPageRoute(
          builder: (_) => NotificationsPage(),
          fullscreenDialog: true,
          maintainState: true,
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
