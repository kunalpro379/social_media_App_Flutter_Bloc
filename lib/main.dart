import 'package:connectiva/presentation/Explore_main_Container/explore.dart';
import 'package:connectiva/presentation/Explore_pages/bloc/Explore.state.dart';
import 'package:connectiva/presentation/Explore_pages/models/explore.model.dart';
import 'package:connectiva/presentation/stories_screen/stories_screen.dart';
import 'package:connectiva/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/utils/size_utils.dart';
import 'global_classes/Custom_TabBar/TabBar.cubit.dart';
import 'presentation/Explore_main_Container/bloc/explore.bloc.dart';
import 'presentation/Explore_main_Container/bloc/explore.state.dart';
import 'presentation/Explore_main_Container/models/explore.model.dart';
import 'presentation/Explore_pages/bloc/Explore.bloc.dart';
import 'presentation/stories_screen/bloc/stories/stories_bloc.dart';
import 'presentation/stories_screen/bloc/stories/stories_event.dart';
import 'presentation/stories_screen/bloc/stories/stories_state.dart';
import 'presentation/stories_screen/models/stories.model.dart';
import 'theme/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:connectiva/routes/app_routes.dart'; // Adjust the path according to your project structure
import 'package:connectiva/global_classes/NavigationService.dart'; // Adjust the path according to your project structure

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          BlocProvider<StoriesBloc>(
            create: (context) => StoriesBloc(StoriesState(
              searchController: TextEditingController(),
              storiesModelObj: StoriesModel(storiesItemList: []),
              isLoading: false,
            ))
              ..add(StoriesInitialEvent()), // Ensure initial event is added
          ),
          BlocProvider<ExploreContainerBloc>(
            create: (context) => ExploreContainerBloc(
              ExploreContentState(
                exploreContentModelObj: ExploreContentModel(),
              ),
            ),
          ),
          BlocProvider<ExploreBloc>(
              create: (context) =>
                  ExploreBloc(ExploreState(ExploreModelObj: ExploreModel()))),
          BlocProvider<TabBarCubit>(
            create: (context) => TabBarCubit(),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        // onGenerateRoute: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        theme: theme, // Applying the theme from theme_helper.dart
        locale: Get.deviceLocale, // Using the device's locale
        fallbackLocale: const Locale('en', 'US'), // Fallback locale
        title: 'connectiva', // App title
        home: ExploreContent(), // Initial screen
      );
    });
  }
}







/*



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreen.dart'; // Assuming HomeScreen.dart contains your HomeScreen widget
import 'TabBarCubit.dart'; // Assuming TabBarCubit.dart contains your TabBarCubit class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TabBarCubit(), // Provide your TabBarCubit
        child: HomeScreen(), // Use HomeScreen as the initial screen
      ),
    );
  }
}











*/






// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       SizeUtils.init(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ExploreContainerBloc>(
//           create: (context) => ExploreContainerBloc(
//             ExploreContentState(
//               exploreContentModelObj: ExploreContentModel(),
//             ),
//           ),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Bottom Navigation Bar',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         initialRoute: AppRoutes.ExplorePage,
//         routes: {
//           AppRoutes.ExplorePage: (context) => ExploreContent.builder(context),
//           AppRoutes.stories: (context) => StoriesScreen(),
//           // Remove the duplicate route
//           // AppRoutes.ExplorePage: (context) => ExploreContent(),
//         },
//       ),
//     );
//   }
// }
