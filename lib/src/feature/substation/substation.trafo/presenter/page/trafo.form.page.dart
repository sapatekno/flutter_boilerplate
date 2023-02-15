import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../app/presenter/widget/dialog.widget.dart';
import '../../../substation.survey/data/entity/request/substation_detail.req.e.dart';

class TrafoFormPage extends StatefulWidget {
  final SubStationDetailReqE? data;

  const TrafoFormPage(this.data, {Key? key}) : super(key: key);

  @override
  State<TrafoFormPage> createState() => _TrafoFormPageState();
}

class _TrafoFormPageState extends State<TrafoFormPage> {
  final formKey = GlobalKey<FormState>();
  final formFocus = FocusNode();

  final trafoNumberController = TextEditingController();
  final trafoCapacityController = TextEditingController();
  final numberOfChannelController = TextEditingController();

  SubStationDetailReqE? trafoData;

  @override
  void initState() {
    super.initState();

    if (widget.data != null) {
      var data = widget.data as SubStationDetailReqE;
      trafoNumberController.text = (data.nomorTrafo ?? '-').toString();
      trafoCapacityController.text = (data.kapasitasTrafo ?? 0).toString();
      numberOfChannelController.text = (data.jumlahSaluran ?? 0).toString();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formFocus.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text((widget.data == null ? AppLocalizations.of(context)!.add : AppLocalizations.of(context)!.edit).toTitleCase())),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: TextFormField(
                controller: trafoNumberController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.trafoNumber.toTitleCase(),
                ),
                focusNode: formFocus,
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.required(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: TextFormField(
                controller: trafoCapacityController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.trafoCapacity.toTitleCase(),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: FormBuilderValidators.required(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: TextFormField(
                controller: numberOfChannelController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.numberOfChannels.toTitleCase(),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: FormBuilderValidators.required(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              showConfirmDialog(
                context,
                null,
                AppLocalizations.of(context)!.saveConfirmation,
                AppLocalizations.of(context)!.yes,
                AppLocalizations.of(context)!.no,
                () {
                  var trafoData = SubStationDetailReqE(
                    jumlahSaluran: int.parse(numberOfChannelController.text),
                    kapasitasTrafo: int.parse(trafoCapacityController.text),
                    nomorTrafo: trafoNumberController.text,
                  );

                  context.pop(trafoData);
                },
              );
            }
          },
          child: Text(
            AppLocalizations.of(context)!.save.toTitleCase(),
          ),
        ),
      ),
    );
  }
}
