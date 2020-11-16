import 'package:flutter/material.dart';
import 'package:omorfias/model/enterprise.dart';
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
import 'package:omorfias/service/Products/EnterpriseService.dart';
import 'package:omorfias/utils/ScreenArguments.dart';
import 'package:omorfias/widget/ScaffoldWithBottomNav.dart';

class EnterpriseScreen extends StatefulWidget {
  @override
  _EnterpriseScreenState createState() => _EnterpriseScreenState();
}

class _EnterpriseScreenState extends State<EnterpriseScreen> {
  FormContext formContext;

  Map<String, dynamic> getArguments() {
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

  Future<Enterprise> getEnterprise() async {
    var enterpriseService = EnterpriseService();
    int id = getArguments()['enterpriseId'];
    var itemEnterprise = await enterpriseService.getEnterprise(id);

    return itemEnterprise;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomNav(
      child: FutureBuilder(
          future: getEnterprise(),
          builder: (BuildContext context, AsyncSnapshot<Enterprise> snapshot) {
            if (snapshot.hasData) {
              var enterprise = snapshot.data;
              return Column(
                children: [
                  ViewImage(
                    enterpriseId: enterprise.id,
                    imageSource: enterprise.urlImage,
                  ),
                  EnterpriseDescription(
                    name: enterprise.name,
                    review: enterprise.evaluation,
                    description: enterprise.description,
                  ),
                  SchedulingSection(),
                  ServiceLocation(
                    formContext: formContext,
                    setFormContext: setFormContext,
                  ),
                  ServiceList(
                    formContext: formContext,
                    setFormContext: setFormContext,
                    serviceList: enterprise.services,
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
              );
            }
            return Container();
          }),
    );
  }
}
