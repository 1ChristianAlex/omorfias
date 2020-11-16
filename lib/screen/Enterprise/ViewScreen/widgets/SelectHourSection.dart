import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/FormContext.dart';
import 'package:omorfias/widget/CardItemShadow.dart';

class SelectHourSection extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  SelectHourSection({Key key, this.formContext, this.setFormContext})
      : super(key: key);

  @override
  _SelectHourSectionState createState() => _SelectHourSectionState();
}

class _SelectHourSectionState extends State<SelectHourSection> {
  List<int> hourRange = List<int>();

  void calcRestHours() {
    List<int> hourList = List<int>();
    int rest = 24 - widget.formContext.selectedDay.hour;
    for (var aditionalHour = 0; aditionalHour < rest + 1; aditionalHour++) {
      if (widget.formContext.selectedDay.hour + aditionalHour < 22) {
        hourList.add(widget.formContext.selectedDay.hour + aditionalHour);
      }
    }
    setState(() {
      hourRange = hourList;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {calcRestHours()});
  }

  void setHourSelected(int hour) {
    var formContext = widget.formContext;

    if (formContext.selectedhours.contains(hour)) {
      formContext.selectedhours.removeWhere((element) => element == hour);
    } else {
      formContext.selectedhours.add(hour);
    }
    widget.setFormContext(formContext);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Selecione o horário do atendimento'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: hourRange.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  int currentHour = hourRange[index];
                  bool containsHour =
                      widget.formContext.selectedhours.contains(currentHour);
                  return CardItemShadow(
                    child: GestureDetector(
                      onTap: () {
                        setHourSelected(currentHour);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: containsHour ? Colors.black : Colors.white,
                        child: Center(
                          child: Text(
                            "$currentHour:59",
                            style: TextStyle(
                              color: containsHour ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
