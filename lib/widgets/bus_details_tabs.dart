import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paribahan/widgets/bus_details_rent_tab.dart';
import 'package:paribahan/widgets/bus_details_reviews_tab.dart';
import 'package:paribahan/widgets/bus_details_route_tab.dart';
import 'package:paribahan/widgets/forward_btn.dart';
import 'package:paribahan/widgets/tab_container.dart';

import '../entities/bus_card_entity.dart';
import '../entities/common_entity.dart';

const double borderRadius = 5.0;

class BusDetailsTabs extends StatefulWidget {
  @override
  _BusDetailsTabsState createState() => _BusDetailsTabsState();
}

class _BusDetailsTabsState extends State<BusDetailsTabs>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: percentOf(65, MediaQuery.of(context).size.height),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      activePageIndex = i;
                    });
                  },
                  children: <Widget>[
                    BusDetailsRouteTab(),
                    TabContainer(
                        child: BusDetailsRentTab(
                      rentChart: getRandomRentChart(),
                    )),
                    TabContainer(child: BusDetailsReviewsTab())
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: _menuBar(context)),
            )),
        Positioned(bottom: 0, child: BusReviewTabBottom())
      ],
    );
  }

  Widget _menuBarItem(String label, int idx) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
      onTap: () => {
        _pageController.animateToPage(idx,
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate)
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: (activePageIndex == idx)
            ? const BoxDecoration(
                color: Color(0xFF3FCB9C),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              )
            : null,
        child: Text(
          label,
          style: (activePageIndex == idx)
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)
              : const TextStyle(color: Color(0xFF6C6C6F)),
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0XFFE0E0E0),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: _menuBarItem("Route", 0),
          ),
          Expanded(
            child: _menuBarItem("Rent Chart", 1),
          ),
          Expanded(
            child: _menuBarItem("Reviews", 2),
          ),
        ],
      ),
    );
  }
}

class BusReviewTabBottom extends StatelessWidget {
  const BusReviewTabBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: percentOf(95, MediaQuery.of(context).size.width)),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: exampleBus.tagList
                        .map((tag) => Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Color(0xFFF9F9F9),
                              ),
                              margin: const EdgeInsets.only(right: 10.0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Text(
                                      '#${tag.name}',
                                      style: const TextStyle(
                                          color: Color(0xFF6C6C6F),
                                          fontSize: 9),
                                    ),
                                    onTap: () {
                                      //print("$tag selected");
                                    },
                                  ),
                                  const SizedBox(width: 4.0),
                                  InkWell(
                                    child: Icon(
                                      Icons.circle,
                                      size: 14.0,
                                      color: tag.feedbackType ==
                                              FeedbackType.positive
                                          ? Color(0XFF9CE2CB)
                                          : Color(0XFFE29C9C),
                                    ),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/images/rating_certification.svg",
                      width: 18,
                      color: Color(0xFF6C6C6E),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "345 Reviews",
                      style: TextStyle(color: Color(0xFF6C6C6E), fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: ForwardBtn(
                  onTap: () {},
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
