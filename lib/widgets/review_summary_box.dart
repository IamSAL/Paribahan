import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewSummaryBox extends StatelessWidget {
  const ReviewSummaryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        elevation: 12, // Change this
        shadowColor: Colors.black45,
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8), // Change this
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("/wip");
          },
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 50, horizontal: 50),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFC700),
                                borderRadius: BorderRadius.circular(2.5)),
                            child: Column(
                              children: [
                                Text(
                                  "3.5",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "out of 5",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          RatingBar(
                            initialRating: 3.5,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: SvgPicture.asset(
                                'assets/images/full_star.svg',
                                semanticsLabel: "review",
                              ),
                              half: SvgPicture.asset(
                                'assets/images/half_star.svg',
                                semanticsLabel: "review",
                              ),
                              empty: SvgPicture.asset(
                                'assets/images/empty_star.svg',
                                semanticsLabel: "review",
                              ),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Excellent"),
                              Container(
                                height: 10,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFC700),
                                ),
                              ),
                              Text("160"),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
