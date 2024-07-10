import 'package:connectiva/presentation/stories_screen/stories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/utils/size_utils.dart';
import 'presentation/stories_screen/bloc/stories/stories_bloc.dart';
import 'presentation/stories_screen/bloc/stories/stories_event.dart';
import 'presentation/stories_screen/bloc/stories/stories_state.dart';
import 'presentation/stories_screen/models/stories.model.dart';
import 'theme/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
        debugShowCheckedModeBanner: false,
        theme: theme, // Applying the theme from theme_helper.dart
        locale: Get.deviceLocale, // Using the device's locale
        fallbackLocale: const Locale('en', 'US'), // Fallback locale
        title: 'connectiva', // App title
        home: StoriesScreen(), // Initial screen
      );
    });
  }
}
