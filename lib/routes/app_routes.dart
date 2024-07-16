import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String logInScreen = '/log_in_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String notificationScreen = '/notification_screen';

  static const String inviteFriendsScreen = '/invite_friends_screen';

  static const String ExplorePage = '/discover_page';

  static const String dailyNewPage = '/daily_new_page';

  static const String dailyNewTabContainerScreen =
      '/daily_new_tab_container_screen';

  static const String trendingPage = '/trending_page';

  static const String trendingTabContainerScreen =
      '/trending_tab_container_screen';

  static const String stories = '/stories_page';

  static const String storiesContainerScreen = '/stories_container_screen';

  static const String trendingPostsPage = '/trending_posts_page';

  static const String trendingPostsTabContainerScreen =
      '/trending_posts_tab_container_screen';

  static const String storiesAndTweetsScreen = '/stories_and_tweets_screen';

  static const String searchScreen = '/search_screen';

  static const String liveScreen = '/live_screen';
  static const String explore = '/explore';

  static const String forYouScreen = '/for_you_screen';

  static const String pageViewScreen = '/page_view_screen';

  static const String commentsScreen = '/comments_screen';

  static const String accountViewScreen = '/account_view_screen';

  static const String accountDetailsScreen = '/account_details_screen';

  static const String messages = '/messages_page';

  static const String chats = '/chat_screen';

  static const String friendsScreen = '/friends_screen';

  static const String notifications = '/notifications_page';

  static const String profile = '/profile_page';

  static const String detailedProfileScreen = '/detailed_profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String a = '/a';
  static const String b = '/b';
  static const String c = '/c';
  static const String d = '/d';
  static const String e = '/e';

  static Map<String, WidgetBuilder> routes = {
    a: (context) => Container(
          color: Colors.amber,
        ),
    b: (context) => Container(
          color: Color.fromARGB(255, 255, 0, 0),
        ),
    c: (context) => Container(
          color: const Color.fromARGB(255, 7, 255, 23),
        ),
    d: (context) => Container(
          color: const Color.fromARGB(255, 7, 110, 255),
        ),
    e: (context) => Container(
          color: const Color.fromARGB(255, 255, 7, 168),
        )
//     splashScreen: (context) => SplashScreen(),
//     loginScreen: (context) => LoginScreen(),
//     logInScreen: (context) => LogInScreen(),
//     forgotPasswordScreen: (context) => ForgotPasswordScreen(),
//     signUpScreen: (context) => SignUpScreen(),
//     notificationScreen: (context) => NotificationScreen(),
//     inviteFriendsScreen: (context) => InviteFriendsScreen(),
//     dailyNewTabContainerScreen: (context) => DailyNewTabContainerScreen(),
//     trendingTabContainerScreen: (context) => TrendingTabContainerScreen(),
//     storiesContainerScreen: (context) => StoriesContainerScreen(),
//     trendingPostsTabContainerScreen: (context) =>
//         TrendingPostsTabContainerScreen(),
//     storiesAndTweetsScreen: (context) => StoriesAndTweetsScreen(),
//     searchScreen: (context) => SearchScreen(),
//     liveScreen: (context) => LiveScreen(),
//     forYouScreen: (context) => ForYouScreen(),
//     pageViewScreen: (context) => PageViewScreen(),
//     commentsScreen: (context) => CommentsScreen(),
//     accountViewScreen: (context) => AccountViewScreen(),
//     accountDetailsScreen: (context) => AccountDetailsScreen(),
//     chatScreen: (context) => ChatScreen(),
//     friendsScreen: (context) => FriendsScreen(),
//     detailedProfileScreen: (context) => DetailedProfileScreen(),
//     appNavigationScreen: (context) => AppNavigationScreen()
  };
}
