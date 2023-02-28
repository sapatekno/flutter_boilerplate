import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/config/config.dart';
import 'package:surveyami/src/feature/customer/customer.survey/presenter/state/customer_survey.state.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../../router/go.router.dart';
import '../../../../../router/sl.router.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../app/presenter/widget/dialog.widget.dart';
import '../../../../app/presenter/widget/loading.widget.dart';
import '../../../../location/presenter/state/location.state.dart';
import '../../../../location/presenter/widget/location_tagging.widget.dart';

class CustomerSurveyPage extends StatelessWidget {
  CustomerSurveyPage({Key? key}) : super(key: key);

  final cubit = sl.get<CustomerSurveyState>();
  final cubitLocation = sl.get<LocationState>();
  final formKey = GlobalKey<FormState>();

  final customerSearchController = TextEditingController();
  final meterBrandController = TextEditingController();
  final meterNumberController = TextEditingController();
  final slController = TextEditingController();
  final rstController = GroupButtonController(disabledIndexes: [0, 1, 2]);
  final srController = GroupButtonController(disabledIndexes: [0, 1, 2, 3, 4]);
  final finalStandController = TextEditingController(text: '0');

  final customerSearchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerSurveyState, MainState>(
      bloc: cubit..initState(),
      buildWhen: (prev, state) => state is LoadState || state is DataState<bool>,
      builder: (context, state) {
        if (state is LoadState) return const LoadingWidget();

        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: blocSearchCustomer(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: blocDataServer(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: blockPhoto(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                child: blockUpdateData(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: LocationTaggingWidget(),
              ),
              Padding(
                padding: EdgeInsets.all(3.w),
                child: ElevatedButton.icon(
                  onPressed: cubit.dataRes == null
                      ? null
                      : () {
                          String selectedRST = '';
                          int selectedSR = 0;

                          if (formKey.currentState!.validate()) {
                            String? errorMessage;
                            if (cubit.localPhotoPath == null) errorMessage = AppLocalizations.of(context)!.surveyMustAttachPhotoMessage;
                            if (cubitLocation.currentPosition == null) errorMessage = AppLocalizations.of(context)!.taggingDataCannotEmptyMessage;
                            if (rstController.selectedIndex == null) errorMessage = AppLocalizations.of(context)!.rstMustSelected;
                            if (srController.selectedIndex == null) errorMessage = AppLocalizations.of(context)!.srMustSelected;
                            if (errorMessage != null) {
                              showInfoDialog(
                                context: context,
                                description: errorMessage,
                                confirmBtnTxt: AppLocalizations.of(context)!.ok,
                              );
                              return;
                            }

                            /// * Convert SRT and SR
                            switch (rstController.selectedIndex!) {
                              case 0:
                                selectedRST = 'R';
                                break;
                              case 1:
                                selectedRST = 'S';
                                break;
                              case 2:
                                selectedRST = 'T';
                                break;
                            }
                            selectedSR = srController.selectedIndex! + 1;

                            showConfirmDialog(
                              context: context,
                              description: AppLocalizations.of(context)!.saveConfirmation,
                              confirmBtnTxt: AppLocalizations.of(context)!.yes,
                              cancelBtnTxt: AppLocalizations.of(context)!.no,
                              onConfirmClicked: () {
                                cubit.saveSurvey(
                                  position: cubitLocation.currentPosition!,
                                  meterBrand: meterBrandController.text,
                                  meterNumber: meterNumberController.text,
                                  sl: slController.text,
                                  selectedRST: selectedRST,
                                  selectedSR: selectedSR,
                                  finalStand: double.parse(finalStandController.text),
                                );
                              },
                            );
                          }
                        },
                  icon: const Icon(Icons.save_alt),
                  label: Text(
                    AppLocalizations.of(context)!.save.toTitleCase(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listenWhen: (prev, state) => state is AlertState || state is UnauthorizedState || state is DataState<bool>,
      listener: (context, state) => onListener(context, state),
    );
  }

  onListener(BuildContext context, MainState state) {
    if (state is DataState<bool>) {
      /// * Melakukan Switcher pada saat data response ada atau tidak
      if (cubit.dataRes != null) {
        rstController.enableIndexes([0, 1, 2]);
        srController.enableIndexes([0, 1, 2, 3, 4]);
      } else {
        meterBrandController.text = '';
        meterNumberController.text = '';
        slController.text = '';
        finalStandController.text = '0';

        rstController.unselectAll();
        rstController.disableIndexes([0, 1, 2]);
        srController.unselectAll();
        srController.disableIndexes([0, 1, 2, 3, 4]);
      }
    }

    if (state is AlertState<Failure>) {
      var failure = state.data;
      showInfoDialog(
        context: context,
        description: Failure.getMessage(context, failure.message ?? "unknownError"),
        confirmBtnTxt: AppLocalizations.of(context)!.ok,
      );
    }

    if (state is AlertState<String>) {
      showInfoDialog(
        context: context,
        description: Failure.getMessage(context, state.data),
        confirmBtnTxt: AppLocalizations.of(context)!.ok,
      );
    }

    if (state is UnauthorizedState) {
      showInfoDialog(
        context: context,
        description: AppLocalizations.of(context)!.unauthorizedMessage,
        confirmBtnTxt: AppLocalizations.of(context)!.login,
        onConfirmClicked: () async {
          var session = sl.get<Session>();
          await session.remove();
          context.go(pathInitial);
        },
      );
    }
  }

  blocSearchCustomer(BuildContext context) {
    return TextFormField(
      readOnly: cubit.dataRes == null ? false : true,
      controller: customerSearchController,
      focusNode: customerSearchFocus,
      decoration: InputDecoration(
        isDense: true,
        hintText: AppLocalizations.of(context)!.findCustomerId.toTitleCase(),
        suffixIcon: IconButton(
          onPressed: () {
            if (cubit.dataRes == null) {
              if (customerSearchController.text.isEmpty) {
                /// * Alert data tidak boleh kosong
                showInfoDialog(
                  context: context,
                  description: AppLocalizations.of(context)!.dataCannotEmptyMessage,
                  confirmBtnTxt: AppLocalizations.of(context)!.ok,
                );
              } else {
                /// * Lakukan pencarian data
                cubit.getCustomerById(customerSearchController.text);
              }
            } else {
              /// * Confirm reset data
              showConfirmDialog(
                context: context,
                description: AppLocalizations.of(context)!.resetConfirmationMessage,
                confirmBtnTxt: AppLocalizations.of(context)!.yes,
                cancelBtnTxt: AppLocalizations.of(context)!.cancel,
                onConfirmClicked: () {
                  cubit.initState();
                  customerSearchController.text = '';
                  customerSearchFocus.requestFocus();
                },
              );
            }
          },
          icon: Icon(
            cubit.dataRes == null ? Icons.search : Icons.close,
            color: cubit.dataRes == null ? Theme.of(context).primaryColor : Colors.red,
          ),
        ),
      ),
    );
  }

  blocDataServer(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.cloud, color: Theme.of(context).primaryColor),
            title: Text(
              AppLocalizations.of(context)!.dataServer.toTitleCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(5),
              },
              children: [
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.customerId.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.idpel ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.name.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.nama ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.rates.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.tarif ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.power.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.daya ?? '0').toString(), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.address.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.alamat ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.substationNumber.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    SelectableText((cubit.dataRes?.nomorGardu ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.latitude.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.latitude ?? '0').toString(), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.longitude.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.longitude ?? '0').toString(), style: const TextStyle(height: 2)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  blockPhoto(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton.icon(
              onPressed: cubit.dataRes == null
                  ? null
                  : () async {
                      final ImagePicker picker = ImagePicker();
                      // Capture a photo
                      final XFile? photo = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 80,
                        maxWidth: 1024,
                        preferredCameraDevice: CameraDevice.rear,
                      );

                      if (photo != null) {
                        cubit.updatePhoto(photo.path);
                      }
                    },
              icon: const Icon(Icons.camera_alt),
              label: Text(cubit.localPhotoPath == null ? AppLocalizations.of(context)!.takePhoto.toTitleCase() : AppLocalizations.of(context)!.changePhoto.toTitleCase()),
            )
          ],
        ),
        cubit.localPhotoPath == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      pathPhotoViewer,
                      extra: FileImage(
                        File(cubit.localPhotoPath!),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'photo',
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(File(cubit.localPhotoPath!)), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 1.w),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  blockUpdateData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: meterBrandController,
          enabled: cubit.dataRes == null ? false : true,
          validator: FormBuilderValidators.required(),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.meterBrand.toTitleCase(),
          ),
        ),
        SizedBox(height: 2.h),
        TextFormField(
          controller: meterNumberController,
          enabled: cubit.dataRes == null ? false : true,
          validator: FormBuilderValidators.required(),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.meterNumber.toTitleCase(),
          ),
        ),
        SizedBox(height: 2.h),
        TextFormField(
          controller: slController,
          enabled: cubit.dataRes == null ? false : true,
          validator: FormBuilderValidators.required(),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.sl.toUpperCase(),
          ),
        ),
        SizedBox(height: 2.h),
        Text(AppLocalizations.of(context)!.rst.toUpperCase()),
        SizedBox(height: 1.h),
        GroupButton(
          isRadio: true,
          enableDeselect: false,
          controller: rstController,
          buttons: const ['R', 'S', 'T'],
          onSelected: null,
        ),
        SizedBox(height: 2.h),
        Text(AppLocalizations.of(context)!.sr.toUpperCase()),
        SizedBox(height: 1.h),
        GroupButton(
          controller: srController,
          isRadio: true,
          enableDeselect: false,
          buttons: const ['1', '2', '3', '4', '5'],
          onSelected: null,
        ),
        SizedBox(height: 2.h),
        TextFormField(
          controller: finalStandController,
          enabled: cubit.dataRes == null ? false : true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.min(1),
          ]),
          textInputAction: TextInputAction.next,
          inputFormatters: [
            /// ? Memastikan input angka dan angka decimal dibelakang adalah 4
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}')),
          ],
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.finalStand.toTitleCase(),
          ),
        ),
      ],
    );
  }
}
