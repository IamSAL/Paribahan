import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paribahan/widgets/backward_btn.dart';
import 'package:paribahan/widgets/feature_card.dart';
import 'package:paribahan/widgets/paribahan_app_bar.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LandingTitle(),
            BackwardBtn(
              onTap: () => Navigator.of(context).pop(),
            )
          ],
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
                "This is a work in progress.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Coming soon",
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
