import 'package:flutter/material.dart';
import 'package:paribahan/widgets/labeledSelect.dart';
import 'package:paribahan/widgets/review_item.dart';
import 'package:paribahan/widgets/review_summary_box.dart';

class BusDetailsReviewsTab extends StatelessWidget {
  const BusDetailsReviewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewSummaryBox(),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LabeledSelect<String>(
                options: ["Recent", "Positive", "Negative"],
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
                                color: Color(0xFF08486A), fontSize: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(value,
                                style: const TextStyle(
                                    color: Color(0xFF08486A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF08486A),
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
                  color: Color(0xFF08486A),
                ),
              ),
            ),
          ],
        ),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
        ReviewItem(),
      ],
    );
  }
}
