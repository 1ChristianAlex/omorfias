import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/FormContext.dart';
import 'package:omorfias/widget/SquaredButton.dart';

class ConfirmSchedulingButtons extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  ConfirmSchedulingButtons({
    Key key,
    this.formContext,
    this.setFormContext,
  }) : super(key: key);

  @override
  _ConfirmSchedulingButtonsState createState() =>
      _ConfirmSchedulingButtonsState();
}

class _ConfirmSchedulingButtonsState extends State<ConfirmSchedulingButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: DesignSystem.spacingMargin,
            ),
            child: SquaredButton(
              onPress: () {},
              primary: false,
              fullWidth: true,
              textWidget: Text(
                'Confirmar Agendamento'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: DesignSystem.spacingMargin,
            ),
            child: SquaredButton(
              onPress: () {},
              primary: true,
              fullWidth: true,
              textWidget: Text(
                'Cancelar'.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
