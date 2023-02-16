import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:go_router_flow/go_router_flow.dart';
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
                            if (cubitLocation.currentPosition == null) errorMessage = AppLocalizations.of(context)!.taggingDataCannotEmptyMessage;
                            if (errorMessage != null) {
                              showInfoDialog(
                                context,
                                null,
                                errorMessage,
                                AppLocalizations.of(context)!.ok,
                                null,
                              );
                              return;
                            }

                            showConfirmDialog(
                              context,
                              null,
                              AppLocalizations.of(context)!.saveConfirmation,
                              AppLocalizations.of(context)!.yes,
                              AppLocalizations.of(context)!.no,
                              () {
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
      listener: (context, state) => onListener(context, state),
    );
  }

  onListener(BuildContext context, MainState state) {
    if (state is AlertState<Failure>) {
      var failure = state.data;
      showInfoDialog(
        context,
        null,
        Failure.getMessage(context, failure.message ?? "unknownError"),
        AppLocalizations.of(context)!.ok,
        null,
      );
    }

    if (state is AlertState<String>) {
      showInfoDialog(
        context,
        null,
        Failure.getMessage(context, state.data),
        AppLocalizations.of(context)!.ok,
        null,
      );
    }

    if (state is UnauthorizedState) {
      showInfoDialog(
        context,
        null,
        AppLocalizations.of(context)!.unauthorizedMessage,
        AppLocalizations.of(context)!.login,
        () async {
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
                showInfoDialog(context, null, AppLocalizations.of(context)!.dataCannotEmptyMessage, AppLocalizations.of(context)!.ok, null);
              } else {
                /// * Lakukan pencarian data
                cubit.getCustomerById(customerSearchController.text);
              }
            } else {
              /// * Confirm reset data
              showConfirmDialog(context, null, AppLocalizations.of(context)!.resetConfirmationMessage, AppLocalizations.of(context)!.yes, AppLocalizations.of(context)!.cancel, () {
                cubit.initState();
                customerSearchController.text = '';
                customerSearchFocus.requestFocus();
              });
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
}
