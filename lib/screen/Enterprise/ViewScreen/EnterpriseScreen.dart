import 'package:flutter/material.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/FormContext.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/ConfirmSchedulingButtons.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/EnterpriseDescription.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/PaymantSection.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/PerformSchedulingSection.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/SchedulingSection.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/SelectHourSection.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/ServiceList.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/ServiceLocation.dart';
import 'package:omorfias/screen/Enterprise/ViewScreen/widgets/ViewImage.dart';
import 'package:omorfias/utils/ScreenArguments.dart';
import 'package:omorfias/widget/ScaffoldWithBottomNav.dart';

class EnterpriseScreen extends StatefulWidget {
  @override
  _EnterpriseScreenState createState() => _EnterpriseScreenState();
}

class _EnterpriseScreenState extends State<EnterpriseScreen> {
  FormContext formContext;

  Map<String, String> getArguments() {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return args.argumentsList;
  }

  @override
  void initState() {
    formContext = FormContext();
    super.initState();
  }

  setFormContext(FormContext newForm) {
    setState(() {
      formContext = newForm;
    });
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomNav(
      child: Column(
        children: [
          ViewImage(),
          EnterpriseDescription(),
          SchedulingSection(),
          ServiceLocation(
            formContext: formContext,
            setFormContext: setFormContext,
          ),
          ServiceList(
            formContext: formContext,
            setFormContext: setFormContext,
          ),
          PerformSchedulingSection(
            formContext: formContext,
            setFormContext: setFormContext,
          ),
          SelectHourSection(
            formContext: formContext,
            setFormContext: setFormContext,
          ),
          PaymentSection(
            formContext: formContext,
            setFormContext: setFormContext,
          ),
          ConfirmSchedulingButtons(
            formContext: formContext,
            setFormContext: setFormContext,
          )
        ],
      ),
    );
  }
}
