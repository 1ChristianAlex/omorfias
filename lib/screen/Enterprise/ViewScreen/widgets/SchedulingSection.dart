import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/screen/Enterprise/AvaibleHours/AvaibleHours.dart';

class SchedulingSection extends StatelessWidget {
  final bool isOpenToScheduling;

  SchedulingSection({
    Key key,
    this.isOpenToScheduling = true,
  }) : super(key: key);

  Widget isOpenWidget(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Icon(Icons.access_time),
            margin: EdgeInsets.only(right: 5),
          ),
          Container(
            child: Text('Aberto Agora', style: TextStyle(color: Colors.green)),
            margin: EdgeInsets.only(right: 5),
          ),
          Text('(Até 20:00)'),
          Expanded(
            child: InkWell(
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Ver todos",
                        style: TextStyle(color: Colors.blue)),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AvaibleHours()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget isCloseWidget(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Icon(Icons.access_time),
            margin: EdgeInsets.only(right: 5),
          ),
          Container(
            child: Text('Fechado', style: TextStyle(color: Colors.red)),
            margin: EdgeInsets.only(right: 5),
          ),
          Expanded(
            child: InkWell(
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Ver horários",
                        style: TextStyle(color: Colors.blue)),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AvaibleHours()));
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: DesignSystem.spacingMargin,
      ),
      child:
          isOpenToScheduling ? isOpenWidget(context) : isCloseWidget(context),
    );
  }
}
