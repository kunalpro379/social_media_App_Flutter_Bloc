import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart'; // Import CrystalNavigationBar
import '../../routes/app_routes.dart';
import '../../widgets/Crystal_NavigationBar.dart/CN_Bar_Item.dart';
import '../../widgets/Crystal_NavigationBar.dart/NavBars.dart';
import '../Explore_pages/explore_main.dart';
import '../stories_screen/stories_screen.dart';
import 'bloc/explore.bloc.dart';
import 'bloc/explore.state.dart';
import 'models/explore.model.dart';

class ExploreContent extends StatelessWidget {
  ExploreContent({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<ExploreContainerBloc>(
      create: (context) => ExploreContainerBloc(
        ExploreContentState(exploreContentModelObj: ExploreContentModel()),
      ),
      child: ExploreContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreContainerBloc, ExploreContentState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.ExplorePage,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => getCurrentPage(context, settings.name!),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CrystalNavigationBar(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(0, 93, 93, 93).withOpacity(0.5),
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  items: navBarItems,
                  currentIndex: 0,
                  onTap: (index) {
                    String route = getCurrentRoute(BottomBarEnum.values[index]);
                    if (route.isNotEmpty) {
                      navigatorKey.currentState?.pushNamed(route);
                    }
                  },
                  outlineBorderColor: Color.fromARGB(255, 255, 255, 255),
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                  enableFloatingNavBar: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.stories;
      case BottomBarEnum.Explore:
        return AppRoutes.ExplorePage;
      case BottomBarEnum.Messages:
        return AppRoutes.messages;
      case BottomBarEnum.Notifications:
        return AppRoutes.notifications;
      case BottomBarEnum.Profile:
        return AppRoutes.profile;
      default:
        return "/";
    }
  }

  List<CrystalNavigationBarItem> navBarItems = [
    CrystalNavigationBarItem(
      icon: Icons.home,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    CrystalNavigationBarItem(
      icon: Icons.explore_rounded,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    CrystalNavigationBarItem(
      icon: Icons.add_a_photo,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    CrystalNavigationBarItem(
      icon: Icons.message_rounded,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    CrystalNavigationBarItem(
      icon: Icons.notifications,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    CrystalNavigationBarItem(
      icon: Icons.person,
      selectedColor: Color.fromARGB(255, 0, 0, 0),
      unselectedColor: const Color.fromARGB(255, 255, 255, 255),
    ),
  ];

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.stories:
        return StoriesScreen();
      case AppRoutes.ExplorePage:
        return ExploreMain();
      case AppRoutes.messages:
        return StoriesScreen();
      case AppRoutes.notifications:
        return StoriesScreen();
      case AppRoutes.profile:
        return StoriesScreen();
      default:
        return StoriesScreen();
    }
  }
}
