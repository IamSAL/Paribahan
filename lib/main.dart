import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:paribahan/pages/coming_soon_page.dart';
import 'package:paribahan/pages/landing_page.dart';
import 'package:paribahan/pages/routes_and_rents/route_search_page.dart';
import 'package:paribahan/widgets/customization/custom_thumb_shape.dart';

void main() {
  initializeDateFormatting("en_US");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Paribahan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            sliderTheme: SliderThemeData(
                rangeThumbShape: CustomThumbShape(),
                inactiveTrackColor: Colors.white.withOpacity(0.75),
                thumbColor: Color(0xFF08486A),
                showValueIndicator: ShowValueIndicator.always),
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme()),
        initialRoute: '/',
        routes: {
          '/': (context) => const LandingPage(),
          '/routes_and_rents': (context) => const RouteSearchPage(),
          '/wip': (context) => const ComingSoonPage(),
        });
  }
}
