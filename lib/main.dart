import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/constants.dart';
import 'package:timelens/core/helper_functions/ongenerate_routes.dart';
import 'package:timelens/core/services/custom_bloc_observer.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/splash/presentation/views/splash_view.dart';
import 'package:timelens/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Supabase.initialize(
    url: kSupaURL,
    anonKey: kSupaKey,
  );
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              textTheme: GoogleFonts.cinzelDecorativeTextTheme(),
            ),

            debugShowCheckedModeBanner: false,
            // showPerformanceOverlay: false,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: SplashView.routeName,

            // flutter localization
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        });
  }
}
