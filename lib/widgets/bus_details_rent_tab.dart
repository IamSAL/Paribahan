import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paribahan/entities/common_entity.dart';

class BusDetailsRentTab extends StatelessWidget {
  final List<RenTableRowEntity> rentChart;
  const BusDetailsRentTab({Key? key, required this.rentChart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: rentChart.map((rentRow) {
          return RenTableRow(renTableRowEntity: rentRow);
        }).toList(),
      ),
    );
  }
}

class RenTableRow extends StatefulWidget {
  final RenTableRowEntity renTableRowEntity;
  const RenTableRow({
    Key? key,
    required this.renTableRowEntity,
  }) : super(key: key);

  @override
  State<RenTableRow> createState() => _RenTableRowState();
}

class _RenTableRowState extends State<RenTableRow> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {
            isExpanded = !isExpanded;
          });
        }
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 0.5, color: Color(0xFF08486A)),
            )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  isExpanded
                      ? 'assets/images/minimize_icon.svg'
                      : 'assets/images/expand_icon.svg',
                  semanticsLabel: "expand",
                  width: 22,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                          color: Color(0xFF08486A), fontSize: 9, height: 1),
                    ),
                    Text(
                      widget.renTableRowEntity.fromStation.name,
                      style: TextStyle(
                        color: Color(0xFF6C6C6F),
                        fontSize: 14,
                        height: 1,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Color(0xFF08486A),
            child: isExpanded
                ? Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(color: Color(0xFF08486A)),
                        child: Text(
                          "To",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: widget.renTableRowEntity.toStationList
                                .asMap()
                                .entries
                                .map((toItem) => RenTableToRow(
                                      busRentInnerRowEntity: toItem.value,
                                      index: toItem.key,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}

class RenTableToRow extends StatelessWidget {
  final BusRentInnerRowEntity busRentInnerRowEntity;
  final int index;
  const RenTableToRow(
      {Key? key, required this.busRentInnerRowEntity, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Color(0xFFD2DCE3) : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(busRentInnerRowEntity.toStation.name),
          Text(
            busRentInnerRowEntity.distance.toString() + "km",
            textAlign: TextAlign.left,
          ),
          Text(busRentInnerRowEntity.rent.toString())
        ],
      ),
    );
  }
}
