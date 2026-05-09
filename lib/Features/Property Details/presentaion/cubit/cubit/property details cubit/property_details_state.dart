part of 'property_details_cubit.dart';

@immutable
sealed class PropertyDetailsState {}

final class PropertyDetailsInitial extends PropertyDetailsState {}

final class PropertyDetailsLoading extends PropertyDetailsState {}

final class PropertyDetailsSuccess extends PropertyDetailsState {
  final PropertyDetailsEntity propertyDetailsEntity;
  PropertyDetailsSuccess(this.propertyDetailsEntity);
}

final class PropertyDetailsFailure extends PropertyDetailsState {
  final String errorMessage;
  PropertyDetailsFailure(this.errorMessage);
}
