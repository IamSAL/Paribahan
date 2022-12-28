// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:paribahan/widgets/block_btn.dart';

class RouteSearchForm extends StatelessWidget {
  const RouteSearchForm({Key? key}) : super(key: key);

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
              SizedBox(
                height: 10,
              ),
              RadioGroup(
                options: ["Location", "Bus", "Route"],
                onChange: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              FromToLocationPicker(),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    "Can’t find your location?",
                    style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Text(
                      "Add a missing place.",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 12),
                    ),
                  )
                ],
              )
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
        BlockBtn(label: "Search", onTap: () => {})
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
            Icon(
              Icons.circle,
              color: Colors.white,
            ),
            SizedBox(
              height: 25,
            ),
            Icon(
              Icons.circle,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: FractionallySizedBox(
                widthFactor: 0.55,
                child: DropdownButton<String>(
                  selectedItemBuilder: (context) {
                    return [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("From",
                              style: TextStyle(
                                  color: Color(0xFFC4C4C4), fontSize: 12)),
                          Text("Khilgaon",
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ];
                  },
                  underline: Container(),
                  icon: Container(),
                  dropdownColor: Colors.white,
                  hint: Text("From"),
                  items: [
                    DropdownMenuItem(
                        child: Text(
                      "Khilgaon",
                    ))
                  ],
                  onChanged: (value) => {},
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: 200,
              color: Color(0xFFC4C4C4),
            ),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: FractionallySizedBox(
                widthFactor: 0.55,
                child: DropdownButton<String>(
                  selectedItemBuilder: (context) {
                    return [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("To",
                              style: TextStyle(
                                  color: Color(0xFFC4C4C4), fontSize: 12)),
                          Text("Khilgaon",
                              style: TextStyle(color: Colors.white))
                        ],
                      )
                    ];
                  },
                  underline: Container(),
                  icon: Container(),
                  dropdownColor: Colors.white,
                  hint: Text("From"),
                  items: [
                    DropdownMenuItem(
                        child: Text(
                      "Khilgaon",
                    ))
                  ],
                  onChanged: (value) => {},
                  isExpanded: true,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.swap_vert,
          color: Colors.white,
          size: 25,
        )
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
            label: option as String,
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

class RadioButton<T> extends StatelessWidget {
  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T> onTap;
  const RadioButton({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
      ),
      child: GestureDetector(
        onTap: () {
          onTap(value);
        },
        child: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color:
                  value == groupValue ? Color(0xFF3FCB9C) : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.white, width: 1)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: (T? currentValue) {
                  onTap(currentValue ?? value);
                },
                activeColor: Colors.white,
                visualDensity: VisualDensity(horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconLabelDropDown extends StatefulWidget {
  const IconLabelDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<IconLabelDropDown> createState() => _IconLabelDropDownState();
}

class _IconLabelDropDownState extends State<IconLabelDropDown> {
  List<String> cityList = [
    "Dhaka Metropolitan",
    "Chittagong",
    "Sylhet",
  ];

  String selectedCity = "Dhaka Metropolitan";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0XFF08486A),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<dynamic>(
        underline: Container(),
        value: cityList[0],
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0XFFC5D2DB),
          size: 35,
        ),
        selectedItemBuilder: selectedCityBuilder,
        items: cityList.map((city) {
          return DropdownMenuItem(
            child: Text(
              city,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF08486A)),
            ),
            value: city,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCity = value;
          });
        },
        isExpanded: true,
      ),
    );
  }

  List<Widget> selectedCityBuilder(context) {
    return [
      Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.apartment,
            color: Colors.white,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              const Text(
                "City",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              Text(
                selectedCity,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )
            ],
          )
        ],
      )
    ];
  }
}

class IconLabelSwitch extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool value;
  const IconLabelSwitch({
    Key? key,
    required this.label,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color(0xFFF4F4FB),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Icon(
                icon,
                color: const Color(0xFF08486A),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(color: Color(0xFF14141C), fontSize: 14),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: (value) => {},
            activeColor: const Color(0XFF08486A),
            activeTrackColor: const Color(0XFF3FCB9C),
            inactiveThumbColor: const Color(0XFF08486A),
            inactiveTrackColor: const Color(0XFFCCE8E1),
          )
        ],
      ),
    );
  }
}
