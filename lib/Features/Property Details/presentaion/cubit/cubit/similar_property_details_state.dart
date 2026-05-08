part of 'similar_property_details_cubit.dart';

@immutable
sealed class SimilarPropertyDetailsState {}

final class SimilarPropertyDetailsInitial extends SimilarPropertyDetailsState {}

final class SimilarPropertyDetailsLoading extends SimilarPropertyDetailsState {}

final class SimilarPropertyDetailsLoaded extends SimilarPropertyDetailsState {
  final List<SimilarPropertyEntity> similarProperties;
  SimilarPropertyDetailsLoaded(this.similarProperties);
}

final class SimilarPropertyDetailsFailure extends SimilarPropertyDetailsState {
  final String message;
  SimilarPropertyDetailsFailure(this.message);
}
