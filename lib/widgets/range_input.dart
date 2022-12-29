import 'package:flutter/material.dart';

class RangeInput extends StatefulWidget {
  const RangeInput({super.key});

  @override
  State<RangeInput> createState() => _RangeInputState();
}

class _RangeInputState extends State<RangeInput> {
  RangeValues _currentRangeValues = const RangeValues(10, 50);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RangeSlider(
        values: _currentRangeValues,
        max: 200,
        divisions: 5,
        activeColor: Colors.white,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
