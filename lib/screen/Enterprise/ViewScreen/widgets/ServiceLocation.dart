import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omorfias/enum/DesignSystem.dart';
import 'package:omorfias/enum/ServiceLocation.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/FormContext.dart';
import 'package:omorfias/widget/SquaredButton.dart';

class ServiceLocation extends StatefulWidget {
  final FormContext formContext;
  final Function setFormContext;

  const ServiceLocation({
    Key key,
    this.formContext,
    this.setFormContext,
  }) : super(key: key);
  @override
  _ServiceLocationState createState() => _ServiceLocationState();
}

class _ServiceLocationState extends State<ServiceLocation> {
  void setServiceLocation(int serviceType) {
    FormContext formState = widget.formContext;
    formState.serviceLocation = serviceType;
    widget.setFormContext(formState);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: DesignSystem.spacingMargin,
        right: DesignSystem.spacingMargin,
        top: 40,
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Selecione o local do atendimento'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.exclamationCircle,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: SquaredButton(
                    paddingX: 40,
                    paddingY: 12,
                    onPress: () {
                      setServiceLocation(ServiceLocationEnum.home);
                    },
                    primary: !(widget.formContext.serviceLocation ==
                        ServiceLocationEnum.home),
                    textWidget: Text(
                      'Em casa'.toUpperCase(),
                      style: TextStyle(
                        color: !(widget.formContext.serviceLocation ==
                                ServiceLocationEnum.home)
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SquaredButton(
                  paddingX: 40,
                  paddingY: 12,
                  onPress: () {
                    setServiceLocation(ServiceLocationEnum.store);
                  },
                  primary: !(widget.formContext.serviceLocation ==
                      ServiceLocationEnum.store),
                  textWidget: Text(
                    'Na loja'.toUpperCase(),
                    style: TextStyle(
                      color: !(widget.formContext.serviceLocation ==
                              ServiceLocationEnum.store)
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
