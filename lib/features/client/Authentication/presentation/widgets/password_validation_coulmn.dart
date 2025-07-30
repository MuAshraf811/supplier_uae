import 'package:supplier_app/core/utils/regex.dart';
import 'package:supplier_app/features/client/Authentication/presentation/controllers/auth/authentication_cubit.dart';
import 'package:supplier_app/features/client/Authentication/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidationPart extends StatefulWidget {
  const PasswordValidationPart({super.key, required this.ctx});
  final BuildContext ctx;
  @override
  State<PasswordValidationPart> createState() => _PasswordValidationPartState();
}

class _PasswordValidationPartState extends State<PasswordValidationPart> {
  bool isUpperCase = false;
  bool isSpecial = false;
  bool isNumber = false;
  @override
  void initState() {
    widget.ctx.read<AuthenticationCubit>().isMoreThan8;
    // widget.ctx
    //     .read<AuthenticationCubit>()
    //     .passwordRegisterController
    //     .addListener(() {
    //   final text = widget.ctx
    //       .read<AuthenticationCubit>()
    //       .passwordRegisterController
    //       .text;
    //
    //   setState(() {
    //     widget.ctx.read<AuthenticationCubit>().isMoreThan8 = text.length >= 8;
    //     widget.ctx.read<AuthenticationCubit>().isSpecial =
    //         RegexValidators.specialCharsValidator.hasMatch(text);
    //     widget.ctx.read<AuthenticationCubit>().isUpperCase =
    //         RegexValidators.upperCaseValidator.hasMatch(text);
    //     widget.ctx.read<AuthenticationCubit>().isNumber =
    //         RegexValidators.numbersValidator.hasMatch(text);
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener:  (context, state) {
        if(state is PassFieldChangedState){
          final text = widget.ctx
              .read<AuthenticationCubit>()
              .passwordRegisterController
              .text;

          setState(() {
            widget.ctx.read<AuthenticationCubit>().isMoreThan8 = text.length >= 8;
            widget.ctx.read<AuthenticationCubit>().isSpecial =
                RegexValidators.specialCharsValidator.hasMatch(text);
            widget.ctx.read<AuthenticationCubit>().isUpperCase =
                RegexValidators.upperCaseValidator.hasMatch(text);
            widget.ctx.read<AuthenticationCubit>().isNumber =
                RegexValidators.numbersValidator.hasMatch(text);
          });
        }

      },
      builder:(context, state) =>  Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          children: [
            PasswordValidationItem(
              validationText: "At least 8 characters",
              isActive: widget.ctx.read<AuthenticationCubit>().isMoreThan8,
            ),
            PasswordValidationItem(
              validationText: "At least 1 Uppercase letter (A-Z)",
              isActive: widget.ctx.read<AuthenticationCubit>().isUpperCase,
            ),
            PasswordValidationItem(
              validationText: " At least 1 special Character",
              isActive: widget.ctx.read<AuthenticationCubit>().isSpecial,
            ),
            PasswordValidationItem(
              validationText: "At least 1 number (0-9)",
              isActive: widget.ctx.read<AuthenticationCubit>().isNumber,
            ),
          ],
        ),
      ),
    );
  }
}
