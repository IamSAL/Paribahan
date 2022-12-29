import 'package:flutter/material.dart';

class RangeInput extends StatefulWidget {
  final String label;
  final double min;
  final double max;
  const RangeInput(
      {super.key, required this.label, this.min = 10, this.max = 50});

  @override
  State<RangeInput> createState() => _RangeInputState();
}

class _RangeInputState extends State<RangeInput> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    _currentRangeValues = RangeValues(widget.min, widget.max);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label.toString(),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75), fontSize: 12)),
          Stack(
            children: [
              Transform.scale(
                scaleX: 1.3,
                scaleY: 1.1,
                child: RangeSlider(
                  values: _currentRangeValues,
                  max: 200,
                  activeColor: Colors.white,
                  // labels: RangeLabels(
                  //   _currentRangeValues.start.round().toString(),
                  //   _currentRangeValues.end.round().toString(),
                  // ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _currentRangeValues.start.round().toString(),
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  Text(
                    _currentRangeValues.end.round().toString(),
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
