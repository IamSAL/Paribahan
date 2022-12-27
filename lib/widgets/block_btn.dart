import 'package:flutter/material.dart';

class BlockBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const BlockBtn({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          backgroundColor: const Color(0xFF14628D),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  8))) // fromHeight use double.infinity as width and 40 is the height
          ),
      child: Text(label),
    );
  }
}
