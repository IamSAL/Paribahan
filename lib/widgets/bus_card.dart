import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paribahan/entities/bus_card_entity.dart';
import 'package:paribahan/widgets/forward_btn.dart';

class BusCard extends StatelessWidget {
  final BusCardEntity bus;
  const BusCard({Key? key, required this.bus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 12, // Change this
      shadowColor: Colors.black45,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8), // Change this
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/busdetails");
        },
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFC5D2DB),
                            size: 9,
                          ),
                          Text(
                            bus.rating.toString(),
                            style: const TextStyle(
                                color: Color(0xFFC5D2DB),
                                fontSize: 9,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Text(
                        bus.route.routeNo,
                        style: const TextStyle(
                            color: Color(0xFF08486A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  ForwardBtn(
                    onTap: () {
                      Navigator.of(context).pushNamed("/busdetails");
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bus.name,
                    style: const TextStyle(
                        color: Color(0xFF14141C),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/money_bdt.svg',
                        semanticsLabel: "route",
                        width: 13,
                      ),
                      Text(
                        bus.rent.toString(),
                        style: const TextStyle(
                            color: Color(0xFF08486A),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0XFFF9F9F9),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/circle_green.svg',
                          semanticsLabel: "route",
                          width: 13,
                        ),
                        Text(
                          bus.route.stoppages.first.name,
                          style: const TextStyle(
                              fontSize: 9, color: Color(0XFF6C6C6F)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Container(
                      height: 36,
                      width: 1,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: Color(0XFFC5D2DB),
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        "Via Mogh bazar, Nabisoc & 4 other stoppages",
                        style: TextStyle(fontSize: 9, color: Color(0XFF6C6C6F)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 36,
                      width: 1,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: Color(0XFFC5D2DB),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/circle_red.svg',
                          semanticsLabel: "route",
                          width: 13,
                        ),
                        Text(
                          bus.route.stoppages.last.name,
                          style:
                              TextStyle(fontSize: 9, color: Color(0XFF6C6C6F)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: bus.tagList
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    '#${tag.name}',
                                    style: const TextStyle(
                                        color: Color(0xFF6C6C6F), fontSize: 9),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
