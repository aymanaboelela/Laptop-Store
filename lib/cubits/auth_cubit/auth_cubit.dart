import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import '../../core/helper/custom_print.dart';
import '../../data/service/login_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());
  void userLogin({required String phoneNum, required String fullName}) {
    emit(LoginInitial());
    try {
      emit(LoginLoading());
      Service.postData(
          data: {"phone": phoneNum, "name": fullName},
          path: "https://magdsoft.ahmedshawky.fun/api/verifyPhone");
      emit(LoginSccess());
    } on DioException catch (err) {
      emit(LoginFailure());
      kPrint(err.response!.statusCode);
    }
  }

  void verifyUser({required String fieldSubmitted, required String phoneNum}) {
    emit(OtpInitial());
    try {
      emit(OtpLoading());
      Service.postData(
          data: {"code": fieldSubmitted, "phone": phoneNum},
          path: "https://magdsoft.ahmedshawky.fun/api/otp");
      emit(OtpSccess());
    } on DioException catch (err) {
      emit(OtpFailure());
      kPrint(err.response!.statusCode);
    }
  }
}
