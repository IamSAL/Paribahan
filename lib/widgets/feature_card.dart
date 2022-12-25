import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  const FeatureCard({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 12, // Change this
      shadowColor: Colors.black45, // Change this
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Tapped $title"),
          ));
        },
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagePath)),
            const SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        )),
      ),
    );
  }
}
