import 'package:flutter/material.dart';

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
