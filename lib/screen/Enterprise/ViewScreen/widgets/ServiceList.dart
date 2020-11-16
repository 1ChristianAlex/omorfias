import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/model/serviceProduct.dart';
import 'package:omorfias/utils/Currency.dart';
import 'package:omorfias/widget/CardCheckBox.dart';
import '../FormContext.dart';

class ServiceList extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  const ServiceList({Key key, this.formContext, this.setFormContext})
      : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: DesignSystem.spacingMargin,
              right: DesignSystem.spacingMargin,
            ),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Agora selecione o serviço(s)'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ServiceItem(
                  formContext: widget.formContext,
                  setFormContext: widget.setFormContext,
                  serviceProduct: ServiceProduct(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final FormContext formContext;
  final Function setFormContext;
  final ServiceProduct serviceProduct;

  ServiceItem(
      {Key key, this.formContext, this.setFormContext, this.serviceProduct})
      : super(key: key);

  void onChange(bool isSelected) {
    formContext.servicesSelected[serviceProduct.id] = isSelected;
    setFormContext(formContext);
  }

  @override
  Widget build(BuildContext context) {
    return CardCheckBox(
      isSelected: formContext.servicesSelected[serviceProduct.id],
      onChange: onChange,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              serviceProduct.title ?? 'Corte Simples',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              serviceProduct.description ??
                  'Hidratação com produtos específicos para cabelos crespos e anelados, e corte simples.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  Currency.doubleToCurrency(serviceProduct.price ?? 35.00),
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
              serviceProduct.oldPrice != null
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Currency.doubleToCurrency(
                            serviceProduct.oldPrice ?? 35.00),
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
