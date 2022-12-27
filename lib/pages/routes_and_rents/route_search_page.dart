import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paribahan/widgets/feature_card.dart';
import 'package:paribahan/widgets/paribahan_app_bar.dart';
import 'package:paribahan/widgets/route_search_form.dart';

class RouteSearchPage extends StatelessWidget {
  const RouteSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/bg_public_transport.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PariBahanAppBar(
          isLoggedIn: true,
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: const [
                      Text(
                        "Routes & Rents",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Search",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Stack(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height / 1.3),
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(25),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))),
                            child: const RouteSearchForm(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
