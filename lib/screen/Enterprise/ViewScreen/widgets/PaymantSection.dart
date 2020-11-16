import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/enum/PaymentMethod.dart';
import 'package:omorfias/widget/CardRadioButton.dart';
import '../FormContext.dart';

class PaymentSection extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  PaymentSection({Key key, this.formContext, this.setFormContext})
      : super(key: key);

  @override
  _PaymentSectionState createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  void onPaymentChange(int payment) {
    widget.formContext.paymentMethod = payment;

    widget.setFormContext(widget.formContext);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: DesignSystem.spacingMargin,
              right: DesignSystem.spacingMargin,
              bottom: 20,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Método de Pagamento'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            child: CardRadioButton(
              current: widget.formContext.paymentMethod,
              value: PaymentMethod.creditCard,
              onChange: onPaymentChange,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.ccMastercard),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Cartão de Credito'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: CardRadioButton(
              current: widget.formContext.paymentMethod,
              value: PaymentMethod.debidCard,
              onChange: onPaymentChange,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.ccVisa),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Cartão de Débito'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: CardRadioButton(
              current: widget.formContext.paymentMethod,
              value: PaymentMethod.money,
              onChange: onPaymentChange,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.moneyBillAlt),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Dinheiro'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
