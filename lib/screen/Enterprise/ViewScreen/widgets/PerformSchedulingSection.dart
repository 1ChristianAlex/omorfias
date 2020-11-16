import 'dart:io';

import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/FormContext.dart';
import 'package:table_calendar/table_calendar.dart';

class PerformSchedulingSection extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  PerformSchedulingSection({
    Key key,
    this.formContext,
    this.setFormContext,
  }) : super(key: key);

  @override
  _PerformSchedulingSectionState createState() =>
      _PerformSchedulingSectionState();
}

class _PerformSchedulingSectionState extends State<PerformSchedulingSection> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void onSelectDate(DateTime dateTime) {
    FormContext formContext = widget.formContext;

    formContext.selectedDay = dateTime;

    widget.setFormContext(formContext);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: DesignSystem.spacingMargin,
              vertical: 20,
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
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: TableCalendar(
              locale: Platform.localeName,
              initialSelectedDay:
                  widget.formContext.selectedDay ?? DateTime.now(),
              onDaySelected: (day, events, holidays) => {onSelectDate(day)},
              calendarController: _calendarController,
              availableCalendarFormats: {CalendarFormat.month: 'Mês'},
              startDay: DateTime.now(),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.black),
                weekendStyle: TextStyle(color: Colors.black),
              ),
              calendarStyle: CalendarStyle(
                selectedColor: Colors.black,
                todayColor: Colors.green,
                weekendStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
