// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paribahan/widgets/block_btn.dart';
import 'package:paribahan/widgets/radio_button.dart';
import 'package:paribahan/widgets/range_input.dart';
import 'package:paribahan/widgets/tags_input.dart';

import 'Icon_label_dropdown.dart';
import 'icon_label_switch.dart';
import 'labeledSelect.dart';

enum SearchByTypes {
  location("Location"),
  bus("Bus"),
  route("Route");

  const SearchByTypes(this.name);
  final String name;
}

class RouteSearchForm extends StatefulWidget {
  const RouteSearchForm({Key? key}) : super(key: key);

  @override
  State<RouteSearchForm> createState() => _RouteSearchFormState();
}

class _RouteSearchFormState extends State<RouteSearchForm> {
  String selectedSearchBy = SearchByTypes.location.name;

  Widget _getSelectedFormFields() {
    if (selectedSearchBy == SearchByTypes.location.name) {
      return ByLocationFields();
    } else if (selectedSearchBy == SearchByTypes.bus.name) {
      return ByBusFields();
    } else if (selectedSearchBy == SearchByTypes.route.name) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/carbon_road.svg",
                  color: Colors.white,
                  semanticsLabel: 'A red up arrow',
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: LabeledSelect<String>(
                  options: ["A320", "A3423", "DM343", "M734"],
                  onChange: (value) => {},
                  label: "Pick Route",
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Missing route?",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.75), fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () => {},
                child: const Text(
                  " Add a route.",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 12),
                ),
              )
            ],
          )
        ],
      );
    } else {
      return Column(
        children: [const Text("Incorrect mode")],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration(
              color: Color(0xFF14628D),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              const IconLabelDropDown(),
              const SizedBox(
                height: 10,
              ),
              RadioGroup(
                options: SearchByTypes.values
                    .map((enumValue) => enumValue.name)
                    .toList(),
                onChange: (value) {
                  setState(() {
                    selectedSearchBy = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _getSelectedFormFields()
            ],
          ),
        ),
        const IconLabelSwitch(
          icon: Icons.school,
          label: "Student pass",
          value: true,
        ),
        const IconLabelSwitch(
          icon: Icons.accessible,
          label: "Disability pass",
          value: false,
        ),
        const SizedBox(
          height: 20,
        ),
        BlockBtn(
            label: "Search",
            onTap: () => Navigator.of(context).pushNamed("/search_result"))
      ],
    );
  }
}

class ByBusFields extends StatelessWidget {
  const ByBusFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledSelect<String>(
                  options: ["Local", "AC", "BRTC"],
                  onChange: (value) => {},
                  label: "Type"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: LabeledSelect<String>(
                  options: ["All", "A643", "A436"],
                  onChange: (value) => {},
                  label: "Route No."),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: RangeInput(label: "Rent Range"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: LabeledSelect<String>(
                  options: ["AC", "Non-AC"],
                  onChange: (value) => {},
                  label: "Condition"),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TagsInput()
      ],
    );
  }
}

class ByLocationFields extends StatelessWidget {
  const ByLocationFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FromToLocationPicker(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Missing location?",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75), fontSize: 12),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => {},
              child: const Text(
                "Add a place.",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontSize: 12),
              ),
            )
          ],
        )
      ],
    );
  }
}

class FromToLocationPicker extends StatelessWidget {
  const FromToLocationPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.white,
            ),
            const SizedBox(
              height: 25,
            ),
            const Icon(
              Icons.circle,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: FractionallySizedBox(
                widthFactor: 0.55,
                child: LabeledSelect<String>(
                    options: ["Khilgaon", "Banani", "Mohammadpur"],
                    onChange: (value) {},
                    label: "From",
                    disableUnderline: true),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.75),
            ),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: FractionallySizedBox(
                widthFactor: 0.55,
                child: LabeledSelect<String>(
                    options: ["Khilgaons", "Bananis", "Mohammadpurs"],
                    onChange: (value) {},
                    label: "To",
                    disableUnderline: true),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: const Icon(
              Icons.swap_vert,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class RadioGroup<T> extends StatefulWidget {
  final List<T> options;
  final ValueChanged<T> onChange;
  final int? defaultIndex;
  const RadioGroup({
    Key? key,
    required this.options,
    required this.onChange,
    this.defaultIndex,
  }) : super(key: key);

  @override
  State<RadioGroup<T>> createState() => _RadioGroupState<T>();
}

class _RadioGroupState<T> extends State<RadioGroup<T>> {
  late T selectedValue;

  @override
  void initState() {
    selectedValue = widget.options[widget.defaultIndex ?? 0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.options.map((option) {
          return RadioButton<T>(
            label: option.toString(),
            value: option,
            groupValue:
                selectedValue ?? widget.options[widget.defaultIndex ?? 0],
            onTap: (T value) {
              setState(() {
                selectedValue = value;
                widget.onChange(selectedValue);
              });
            },
          );
        }).toList());
  }
}
