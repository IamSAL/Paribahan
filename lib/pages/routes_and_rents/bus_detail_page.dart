// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:paribahan/entities/bus_card_entity.dart';
import 'package:paribahan/widgets/bus_card.dart';
import 'package:paribahan/widgets/feature_card.dart';
import 'package:paribahan/widgets/labeledSelect.dart';
import 'package:paribahan/widgets/paribahan_app_bar.dart';
import 'package:paribahan/widgets/route_search_form.dart';

class BusDetailPage extends StatelessWidget {
  const BusDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFC),
      extendBodyBehindAppBar: true,
      appBar: PariBahanAppBar(
        isLoggedIn: true,
        systemUiOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            systemStatusBarContrastEnforced: false,
            statusBarColor: Color.fromARGB(255, 30, 92, 126).withOpacity(0.85),
            statusBarIconBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/bg_public_transport.png"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 8, 67, 99).withOpacity(0.85),
                          BlendMode.darken),
                      alignment: Alignment.topCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(5),
                    color: Colors.white.withOpacity(0.29),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Khilgaon",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SvgPicture.asset(
                            'assets/images/bus_side.svg',
                            semanticsLabel: "route",
                            width: 24,
                          ),
                          Text(
                            "Banani",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bolaka Paribahan",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/carbon_road.svg',
                            semanticsLabel: "route",
                            width: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "A360",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/carbon_review.svg',
                            semanticsLabel: "route",
                            width: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "3.5",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/money_bdt.svg',
                            semanticsLabel: "route",
                            width: 13,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "25.00",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Text("bus detail"),
            )
          ],
        ),
      ),
    );
  }
}
