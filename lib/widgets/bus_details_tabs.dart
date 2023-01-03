import 'package:flutter/material.dart';
import 'package:paribahan/widgets/bus_details_rent_tab.dart';
import 'package:paribahan/widgets/bus_details_reviews_tab.dart';
import 'package:paribahan/widgets/bus_details_route_tab.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: _menuBar(context),
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
                BusDetailsRentTab(),
                BusDetailsReviewsTab()
              ],
            ),
          ),
        ],
      ),
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
