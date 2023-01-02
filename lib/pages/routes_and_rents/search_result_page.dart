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

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

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
          mainAxisSize: MainAxisSize.min,
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
                    height: 90,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: LabeledSelect<String>(
                          options: ["Cheapest", "Best Rating"],
                          onChange: (value) {},
                          label: "Sorted by",
                          disableUnderline: true,
                          customSelectedItemBuilder: (context, options) {
                            return options.map((dynamic value) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Sorted by",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.75),
                                          fontSize: 12)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(value,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0XFFC5D2DB),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }).toList();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: const Icon(
                            Icons.tune,
                            color: Color(0XFFC5D2DB),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Color(0xFF14628D),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/filter_filled.svg',
                          semanticsLabel: "filter",
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Type to filter...',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 12),
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10.0),
                                border: UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.75),
                                      width: 0.75),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.5),
                                ),
                                isDense: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Transform.translate(
                offset: Offset(0, -25),
                child: Column(
                  children: getRandomBusList()
                      .map((BusCardEntity bus) => BusCard(bus: bus))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
