import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:flutter_boilerplate/src/util/string.util.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/config.dart';
import '../../../../../router/sl.router.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/presenter/widget/loading.widget.dart';
import '../state/login.state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final loginState = sl.get<LoginState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginState, MainState>(
        bloc: loginState..getToken(),
        listenWhen: (prev, current) => current is AlertState,
        listener: (context, state) => onListener(context, state),
        buildWhen: (prev, state) => state is LoadState || state is DataState<bool> || state is FailState,
        builder: (context, state) {
          if (state is LoadState) return const LoadingWidget();

          if (state is DataState<bool>) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),
                  blockLogin(context),
                  blockRegister(context),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget blockLogin(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Text(
              AppLocalizations.of(context)!.login.toTitleCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: TextFormField(
              controller: userController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: AppLocalizations.of(context)!.username.toTitleCase(),
              ),
              validator: FormBuilderValidators.required(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: BlocBuilder<LoginState, MainState>(
              bloc: loginState,
              buildWhen: (prev, current) => current is PasswordObscureTextState,
              builder: (context, state) {
                var data = state is PasswordObscureTextState ? state : PasswordObscureTextState(true);
                return TextFormField(
                  controller: passController,
                  obscureText: data.value,
                  validator: FormBuilderValidators.required(),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.password.toTitleCase(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        data.value ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        loginState.setPasswordObscureTextState(!data.value);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.login.toTitleCase()),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    loginState.doLogin(userController.text, passController.text);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockRegister(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.createAccount.toTitleCase(),
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }

  onListener(BuildContext context, MainState state) {
    if (state is AlertState<Failure>) {
      String description = AppLocalizations.of(context)!.noData;
      if (state.data.message != null) {
        if (state.data.message == 'fromNoInternetConnection') description = AppLocalizations.of(context)!.failNoInternet;
      }
      showInfoDialog(
        context,
        null,
        description.toCapitalize(),
        AppLocalizations.of(context)!.ok.toTitleCase(),
      );
    }
  }
}
