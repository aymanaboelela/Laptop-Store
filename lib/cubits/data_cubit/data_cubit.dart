import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../core/helper/custom_print.dart';
import '../../data/model/help_model.dart';
import '../../data/service/login_service.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  List<Help> helpModel = [];
  void getHelp() async {
    emit(HelpLoading());
    try {
      await Service.init();
      helpModel = await Service.getHelp();
      emit(HelpSccess());
    } on DioException catch (err) {
      emit(HelpFailure());
      kPrint("Error from getHelp: $err");
    }
  }

  void getProduct() async {
    emit(DataInitial());
    try {
      emit(ProductLoading());
      await Service.getProduct();
      emit(ProductSccess());
    } on DioException catch (err) {
      emit(Productailure());
      kPrint("Error from getHelp: $err");
    }
  }
}
