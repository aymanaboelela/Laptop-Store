part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

//?LOGIN
final class LoginInitial extends AuthState {}

final class LoginSccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {}

//?OTP
final class OtpInitial extends AuthState {}

final class OtpSccess extends AuthState {}

final class OtpFailure extends AuthState {}

final class OtpLoading extends AuthState {}



//! sccess
//! failure
//! loading