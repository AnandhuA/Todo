part of 'featchdata_bloc.dart';

@immutable
sealed class FeatchdataState {}

final class FeatchdataInitial extends FeatchdataState {}

final class FeatchdataLoading extends FeatchdataState {}

final class FeatchdataSuccess extends FeatchdataState {
  final Map<String, dynamic> data;

  FeatchdataSuccess({required this.data});
}

final class FeatchdataFailure extends FeatchdataState {}
