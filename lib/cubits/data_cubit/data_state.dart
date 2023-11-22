part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}

//? GET HELP
final class HelpSccess extends DataState {}

final class HelpFailure extends DataState {}

final class HelpLoading extends DataState {}

//? GET PRODUCT
final class ProductSccess extends DataState {}

final class Productailure extends DataState {}

final class ProductLoading extends DataState {}
