import 'package:flutter/material.dart';

class HorizontalCardScroll extends StatefulWidget {
  final Widget listView;

  HorizontalCardScroll({Key key, this.listView}) : super(key: key);

  @override
  _HorizontalCardScrollState createState() => _HorizontalCardScrollState();
}

class _HorizontalCardScrollState extends State<HorizontalCardScroll> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: widget.listView,
    );
  }
}
