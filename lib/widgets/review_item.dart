import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'review_summary_box.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

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
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              children: [
                UserStarRow(),
                SizedBox(
                  height: 5,
                ),
                ExpandableText(
                  "Riding bolaka is like riding a deshi roller coaster, drivers are straight outta GTA.its funky and funny to ride bolaka ",
                  expandText: 'read more',
                  collapseText: 'show less',
                  maxLines: 2,
                  linkColor: Color(0xFF08486A),
                  style: TextStyle(color: Color(0xFF6C6C6F), fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [1, 2, 3, 4, 5].map((idx) {
                    const review_image = Image(
                      image: AssetImage('assets/images/review_image.png'),
                      width: 25,
                      fit: BoxFit.cover,
                    );

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      child: idx == 5
                          ? Stack(
                              children: [
                                review_image,
                                Container(
                                  height: 25,
                                  width: 25,
                                  color: Colors.white.withOpacity(0.75),
                                  child: Center(
                                      child: Text(
                                    "+3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            )
                          : review_image,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Color(0xFF14628D),
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "20",
                          style:
                              TextStyle(color: Color(0xFF14628D), fontSize: 13),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Color(0xFFB8B8B8),
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "20",
                          style:
                              TextStyle(color: Color(0xFFB8B8B8), fontSize: 13),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class UserStarRow extends StatelessWidget {
  const UserStarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/loggedin_avatar.png'),
              width: 36,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sheikh Salman",
                  style: TextStyle(
                      color: Color(0XFF6C6C6F),
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                RatingStarsItem(
                  rating: 4.5,
                )
              ],
            )
          ],
        ),
        Text(
          "2 days ago",
          style: TextStyle(fontSize: 10, color: Color(0xFFC5D2DB)),
        )
      ],
    );
  }
}
