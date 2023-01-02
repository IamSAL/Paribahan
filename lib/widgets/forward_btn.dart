import 'package:flutter/material.dart';

class ForwardBtn extends StatelessWidget {
  final VoidCallback onTap;
  const ForwardBtn({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF08486A)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(58.0),
                bottomRight: Radius.circular(58.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Details'),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
      onPressed: onTap,
    );
  }
}
