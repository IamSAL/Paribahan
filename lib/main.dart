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
            sliderTheme: SliderThemeData(
              trackHeight: 2,
              rangeThumbShape: CustomRangeThumbShape(),
              inactiveTrackColor: Colors.white.withOpacity(0.75),
            ),
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
