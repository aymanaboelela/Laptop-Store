import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../core/constant/color.dart';
import '../../core/constant/route.dart';
import '../../core/helper/custom_print.dart';
import '../../core/helper/responsive.dart';
import '../../core/helper/scaffold_snakbar.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CenterInput extends StatelessWidget {
  const CenterInput({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String? fullName;
    String? phoneNum;
    bool isloading = false;
    return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
      if (state is LoginFailure) {
        isloading = false;
        scaffoldSnackBar(context, "invalid name or phone number");
      } else if (state is LoginSccess) {
        isloading = false;
        Navigator.pushReplacementNamed(context, kOtp);
      } else if (state is LoginLoading) {
        isloading = true;
      }
    }, child: BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  const SizeVertical(value:5 ),
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: formKey,
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.defaultSize! * 37,
                    height: SizeConfig.defaultSize! * 35,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 10,
                            offset: Offset(2, 5),
                            spreadRadius: 4,
                          ),
                        ],
                        color: kWhite,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizeVertical(value: 1),
                          const Text("Welcome",
                              style: TextStyle(fontSize: 30, color: kBlack)),
                          const SizeVertical(value: 1),
                          const Divider(
                            thickness: 4,
                            endIndent: 120,
                            indent: 120,
                            color: kBlue,
                          ),
                          const SizeVertical(value: 2.5),
                          CustomTextFormField(
                            onSaved: (data) {
                              fullName = data;
                            },
                            width: SizeConfig.screenWidth! * 0.7,
                            label: "Enter your Full Name",
                          ),
                          const SizeVertical(value: 2),
                          CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            onSaved: (data) {
                              phoneNum = data;
                            },
                            width: SizeConfig.screenWidth! * 0.7,
                            label: "Enter your Phone Number",
                          ),
                          const SizeVertical(value: 2.5),
                          CustomButton(
                            title: "Login",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                //! Service.

                                BlocProvider.of<AuthCubit>(context).userLogin(
                                    phoneNum: phoneNum!, fullName: fullName!);
                                kPrint(
                                    "fullName : $fullName & phoneNum : $phoneNum");
                                Navigator.pushNamed(context, kOtp);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizeVertical(value: 12),
            ],
          ),
        );
      },
    ));
  }
}
