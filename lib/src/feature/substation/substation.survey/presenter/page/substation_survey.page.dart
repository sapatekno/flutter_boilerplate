import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../../config/config.dart';
import '../../../../../router/go.router.dart';
import '../../../../../router/sl.router.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../app/presenter/widget/dialog.widget.dart';
import '../../../../app/presenter/widget/loading.widget.dart';
import '../../../../location/presenter/state/location.state.dart';
import '../../../../location/presenter/widget/location_tagging.widget.dart';
import '../../data/entity/request/substation_detail.req.e.dart';
import '../state/substation_survey.state.dart';

class SubStationSurveyPage extends StatelessWidget {
  SubStationSurveyPage({Key? key}) : super(key: key);

  final cubit = sl.get<SubStationSurveyState>();
  final cubitLocation = sl.get<LocationState>();
  final formKey = GlobalKey<FormState>();

  final substationSearchController = TextEditingController();
  final trafoController = TextEditingController(text: '0');

  final substationSearchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStationSurveyState, MainState>(
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
                  child: blockSearchSubstation(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: blockDataServer(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                  child: blockPhoto(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: blockTrafo(context),
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
                            if (formKey.currentState!.validate()) {
                              String? errorMessage;
                              if (cubit.localPhotoPath == null) errorMessage = AppLocalizations.of(context)!.surveyMustAttachPhotoMessage;
                              if (cubitLocation.currentPosition == null) errorMessage = AppLocalizations.of(context)!.taggingDataCannotEmptyMessage;
                              if (errorMessage != null) {
                                showInfoDialog(
                                  context: context,
                                  description: errorMessage,
                                  confirmBtnTxt: AppLocalizations.of(context)!.ok,
                                );
                                return;
                              }

                              showConfirmDialog(
                                context: context,
                                description: AppLocalizations.of(context)!.saveConfirmation,
                                confirmBtnTxt: AppLocalizations.of(context)!.yes,
                                cancelBtnTxt: AppLocalizations.of(context)!.no,
                                onConfirmClicked: () {
                                  cubit.saveSurvey(cubitLocation.currentPosition!);
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
        listenWhen: (prev, state) => state is AlertState || state is UnauthorizedState,
        listener: (context, state) => onListener(context, state));
  }

  onListener(BuildContext context, MainState state) {
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

  blockSearchSubstation(BuildContext context) {
    return TextFormField(
      readOnly: cubit.dataRes == null ? false : true,
      controller: substationSearchController,
      focusNode: substationSearchFocus,
      decoration: InputDecoration(
        isDense: true,
        hintText: AppLocalizations.of(context)!.findSubstationNumber.toTitleCase(),
        suffixIcon: IconButton(
          onPressed: () {
            if (cubit.dataRes == null) {
              if (substationSearchController.text.isEmpty) {
                /// * Alert data tidak boleh kosong
                showInfoDialog(
                  context: context,
                  description: AppLocalizations.of(context)!.dataCannotEmptyMessage,
                  confirmBtnTxt: AppLocalizations.of(context)!.ok,
                );
              } else {
                /// * Lakukan pencarian data
                cubit.getGarduById(substationSearchController.text);
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
                  substationSearchController.text = '';
                  substationSearchFocus.requestFocus();
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

  blockDataServer(BuildContext context) {
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
              children: [
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
                    Text((cubit.dataRes?.nomorGardu ?? '-'), style: const TextStyle(height: 2)),
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
                    Text((cubit.dataRes?.latitude ?? 0).toString(), style: const TextStyle(height: 2)),
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
                    Text((cubit.dataRes?.longitude ?? 0).toString(), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.substationType.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.typeGardu ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.description.toTitleCase(),
                      style: const TextStyle(
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: const Text(" :", style: TextStyle(height: 2)),
                    ),
                    Text((cubit.dataRes?.description ?? '-'), style: const TextStyle(height: 2)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  blockTrafo(BuildContext context) {
    var trafoData = cubit.dataReq?.detailGardu?.length ?? 0;
    trafoController.text = trafoData.toString();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: cubit.dataRes == null ? false : true,
            controller: trafoController,
            validator: FormBuilderValidators.min(1),
            onTap: () async {
              final List<SubStationDetailReqE>? result = await context.push(pathTrafo, extra: cubit.dataReq?.detailGardu);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (result != null) {
                  // * ada penambahan
                  cubit.updateDetailGardu(result);
                }
              });
            },
            readOnly: true,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.numberOfTrafo.toTitleCase(),
              suffixIcon: Icon(
                Icons.chevron_right,
                color: cubit.dataRes == null ? Colors.grey : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
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
                      extra: FileImage(File(cubit.localPhotoPath!)),
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
}
