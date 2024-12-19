import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:socigate_system/src/core/error/handle_failure.dart';
import 'package:socigate_system/src/core/routes/names.dart';
import 'package:socigate_system/src/modules/auth/presentation/pages/success_page.dart';
import 'package:socigate_system/src/modules/auth/presentation/widgets/auth_image_section.dart';
import '../bloc/auth_bloc.dart';
import 'forget_password_page.dart';
import 'login_form_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AuthBloc>(),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              handleFailure(context, state.failure);
            } else if (state is AuthSuccessState) {
               context.go(RoutesName.dashboard);
            }
          },
          child: Row(
            children: [
              Expanded(
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) {
                    return current is LoginUIState ||
                        current is ForgetPasswordUIState ||
                        current is ForgetPasswordSuccessUiState;
                  },
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: _buildContentForState(state, context),
                    );
                  },
                ),
              ),
              const AuthImageSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentForState(AuthState state, BuildContext context) {
    if (state is ForgetPasswordUIState) {
      return ForgetPasswordPage(
        onBackToLogin: () => context.read<AuthBloc>().add(ToggleViewEvent()),
      );
    } else if (state is ForgetPasswordSuccessUiState) {
      return SuccessPage(
          goBack: () => context.read<AuthBloc>().add(ToggleViewEvent()));
    } else {
      return LoginFormPage(
        onForgotPassword: () => context.read<AuthBloc>().add(ToggleViewEvent()),
      );
    }
  }
}
