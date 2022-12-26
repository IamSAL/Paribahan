import 'package:flutter/material.dart';

class BackwardBtn extends StatelessWidget {
  final VoidCallback onTap;
  const BackwardBtn({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF08486A)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(58.0),
                  bottomLeft: Radius.circular(58.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text('Back')
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}
