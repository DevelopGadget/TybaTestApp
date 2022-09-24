import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:typatestapp/models/values.model.dart';
import 'package:typatestapp/providers/translate.provider.dart';
import 'package:typatestapp/providers/universities.provider.dart';
import 'package:typatestapp/widgets/home.widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    Provider.of<UniversitiesProvider>(context).controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [TranslateDelegate(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('es')],
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(320, name: '$MOBILE 320', scaleFactor: 0.7),
          const ResponsiveBreakpoint.autoScale(400, name: '$MOBILE 400', scaleFactor: 0.9),
          const ResponsiveBreakpoint.autoScale(480, name: '$MOBILE 480'),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 1.1),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP, scaleFactor: 1.2),
          const ResponsiveBreakpoint.autoScale(2460, name: '4K', scaleFactor: 1.3),
        ],
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(child: const Home(), type: PageTransitionType.rightToLeftWithFade);
          default:
            return null;
        }
      },
      theme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: Values.background,
        primaryColor: Values.primaryColor,
        focusColor: Values.primaryColor,
        brightness: Brightness.light,
        textTheme: GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white)),
        cardColor: Values.cardColor,
        canvasColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Values.accentColor),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}