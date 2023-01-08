import 'package:flutter/material.dart';

class TabContainer extends StatefulWidget {
  final Widget child;
  const TabContainer({Key? key, required this.child}) : super(key: key);

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  late ScrollController _controller;
  ScrollPhysics scrollPhysics = const ClampingScrollPhysics();
  _scrollListener() {
    if (_controller.offset == 0.0 ||
        _controller.position.extentBefore == 0.0 ||
        _controller.position.extentAfter == 0.0) {
      // scrollPhysics = const NeverScrollableScrollPhysics();

      Future.delayed(const Duration(seconds: 1), () {
        scrollPhysics = const ClampingScrollPhysics();
        setState(() {});
      });

      setState(() {});
      ;
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        margin: EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
            color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(5)),
        child: SingleChildScrollView(
          controller: _controller,
          physics: scrollPhysics,
          child: widget.child,
        ),
      ),
    );
  }
}
