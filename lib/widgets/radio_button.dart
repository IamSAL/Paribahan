import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color: value == groupValue
                  ? const Color(0xFF3FCB9C)
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                visualDensity: const VisualDensity(horizontal: 0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                label,
                style: const TextStyle(
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
