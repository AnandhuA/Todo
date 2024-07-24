import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';

part 'featchdata_event.dart';
part 'featchdata_state.dart';

class FeatchdataBloc extends Bloc<FeatchdataEvent, FeatchdataState> {
  FeatchdataBloc() : super(FeatchdataInitial()) {
    on<FeatchdataEvent>((event, emit) async {
      emit(FeatchdataLoading());
      final data = await readData();

      if (data == null) {
        emit(FeatchdataFailure());
      } else {
        emit(FeatchdataSuccess(data: data));
      }
    });
  }
}
