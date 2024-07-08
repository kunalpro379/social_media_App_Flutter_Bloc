import 'package:connectiva/presentation/stories_screen/stories_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'core/utils/size_utils.dart';
import 'presentation/splash_screen.dart';
import 'core/app_export.dart';
import 'routes/app_routes.dart';
import 'theme/theme_helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting the preferred orientation to portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    // Initializing the logger
    //Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sizer for responsive design
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme, // Applying the theme from theme_helper.dart
        locale: Get.deviceLocale, // Using the device's locale
        fallbackLocale: const Locale('en', 'US'), // Fallback locale
        title: 'connectiva', // App title
        //initialBinding: InitialBindings(), // Initial bindings
        //initialRoute: AppRoutes.initialRoute, // Initial route
        //getPages: AppRoutes.pages, // Defining app pages
        home: StoriesScreen(), // Initial screen
      );
    });
  }
}
