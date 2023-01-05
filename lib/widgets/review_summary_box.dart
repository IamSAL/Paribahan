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
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFC700),
                              borderRadius: BorderRadius.circular(2.5)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingStarsItem(
                          rating: 3.5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ReviewStatItem(
                          label: "Excellent",
                          count: 160,
                          total: 340,
                        ),
                        ReviewStatItem(
                          label: "Good",
                          count: 56,
                          total: 340,
                        ),
                        ReviewStatItem(
                          label: "Average",
                          count: 5,
                          total: 340,
                        ),
                        ReviewStatItem(
                          label: "Poor",
                          count: 4,
                          total: 340,
                        ),
                        ReviewStatItem(
                          label: "Terrible",
                          count: 6,
                          total: 340,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class RatingStarsItem extends StatelessWidget {
  final double rating;
  const RatingStarsItem({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
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
      itemSize: 10,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class ReviewStatItem extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  const ReviewStatItem({
    Key? key,
    required this.label,
    required this.count,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 50),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xFF6C6C6F),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5)),
                ),
                Builder(builder: (context) {
                  return Container(
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 20,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFC700),
                        borderRadius: BorderRadius.circular(5)),
                  );
                })
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 9,
                      color: Color(0xFF6C6C6F),
                    ),
                  ))),
        ],
      ),
    );
  }
}
