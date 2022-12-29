import 'package:flutter/material.dart';

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
              const SizedBox(
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
