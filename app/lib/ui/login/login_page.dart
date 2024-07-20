import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resources/resources.dart';
import 'package:snapping_bottom_sheet/snapping_bottom_sheet.dart';

import '../../app.dart';
import 'bloc/login.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        leadingIcon: navigator.canPopSelfOrChildren ? LeadingIcon.close : LeadingIcon.none,
        leadingIconColor: AppColors.current.secondaryColor,
        titleType: AppBarTitle.text,
        centerTitle: true,
        text: S.current.login,
        backgroundColor: AppColors.current.primaryColor,
        titleTextStyle: AppTextStyles.s20w700Title2(),
      ),
      body: 
        SafeArea(
          child: SnappingBottomSheet(
            elevation: 8,
            cornerRadius: Dimens.d20,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.95,1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            scrollSpec: const ScrollSpec(overscroll: false),
            cornerRadiusOnFullscreen: 0.0,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryBG,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 350),
                child: Assets.images.bacoon.svg(),
              ),
            ),
            builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
              child: Column(
                children: [
                  SizedBox(height: Dimens.d30.responsive()),
                  AppTextField(
                    title: S.current.email,
                    hintText: S.current.email,
                    onChanged: (email) => bloc.add(EmailTextFieldChanged(email: email)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: Dimens.d24.responsive()),
                  AppTextField(
                    title: S.current.password,
                    hintText: S.current.password,
                    onChanged: (pass) => bloc.add(PasswordTextFieldChanged(password: pass)),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: Dimens.d15.responsive()),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.onPageError != current.onPageError,
                    builder: (_, state) => Text(
                      state.onPageError,
                      style: AppTextStyles.s14w400Secondary().copyWith(color: Colors.red),
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.isLoginButtonEnabled != current.isLoginButtonEnabled,
                    builder: (context, state) {
                      return _renderButton(state);
                    },
                  ),
                  SizedBox(height: Dimens.d50.responsive()),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _renderButton(LoginState state) {
    return GestureDetector(
      onTap: () {
        bloc.add(const LoginButtonPressed());
      },
      child: Container(
        height: Dimens.d50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: state.isLoginButtonEnabled ? AppColors.current.baseColors4 : null,
            borderRadius: BorderRadius.circular(Dimens.d20),
            border: Border.all(color: AppColors.current.baseColors4)),
        child: Center(
            child: Text(S.current.login,
                style: AppTextStyles.s20w700Title2().copyWith(
                    color: state.isLoginButtonEnabled
                        ? Colors.white
                        : AppColors.current.baseColors4))),
      ),
    );
  }
}
