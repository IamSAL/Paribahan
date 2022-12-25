import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paribahan/widgets/feature_card.dart';
import 'package:paribahan/widgets/paribahan_app_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/landing_background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PariBahanAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LandingTitle(),
              const SizedBox(
                height: 100,
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: const [
                  FeatureCard(
                    imagePath: 'assets/images/iconroute.png',
                    title: "Routes & Rents",
                  ),
                  FeatureCard(
                    imagePath: 'assets/images/iconnews.png',
                    title: "Traffic News",
                  ),
                  FeatureCard(
                    imagePath: 'assets/images/iconconnect.png',
                    title: "Connect",
                  ),
                  FeatureCard(
                    imagePath: 'assets/images/iconcontribute.png',
                    title: "Contribute",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LandingTitle extends StatelessWidget {
  const LandingTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var formattedDate = DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY, 'en_US')
        .format(date.toUtc());

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                formattedDate.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome To Paribahan App.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}
