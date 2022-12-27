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
          height: 300,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration(
              color: Color(0xFF14628D),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              const IconLabelDropDown(),
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
