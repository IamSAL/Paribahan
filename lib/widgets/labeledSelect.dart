import 'package:flutter/material.dart';

typedef List<Widget> selectedItemBuilderFunc(
    BuildContext context, List<dynamic> options);

class LabeledSelect<T> extends StatefulWidget {
  final List<T> options;
  final ValueChanged<T?> onChange;
  final String label;
  final bool? disableUnderline;
  final selectedItemBuilderFunc? customSelectedItemBuilder;
  const LabeledSelect({
    Key? key,
    required this.options,
    required this.onChange,
    required this.label,
    this.disableUnderline = false,
    this.customSelectedItemBuilder,
  }) : super(key: key);

  @override
  State<LabeledSelect<T>> createState() => _LabeledSelectState<T>();
}

class _LabeledSelectState<T> extends State<LabeledSelect<T>> {
  late T currentValue;

  @override
  void initState() {
    currentValue = widget.options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: currentValue,
      selectedItemBuilder: selectedItemBuilder,
      underline: Container(),
      icon: Container(),
      dropdownColor: Colors.white,
      items: widget.options
          .map((option) => DropdownMenuItem<T>(
              value: option,
              child: Text(
                option.toString(),
              )))
          .toList(),
      onChanged: (value) {
        setState(() {
          currentValue = value ?? widget.options[0];
          widget.onChange(value);
        });
      },
      isExpanded: true,
      itemHeight: kMinInteractiveDimension + 5,
    );
  }

  List<Widget> selectedItemBuilder(context) {
    if (widget.customSelectedItemBuilder != null) {
      return widget.customSelectedItemBuilder!(context, widget.options);
    }
    return widget.options.map((T value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(widget.label.toString(),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75), fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(currentValue.toString(),
                  style: const TextStyle(color: Colors.white)),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0XFFC5D2DB),
              )
            ],
          ),
          Container(
              height: widget.disableUnderline == false ? 1 : 0,
              color: Colors.white.withOpacity(0.75))
        ],
      );
    }).toList();
  }
}
