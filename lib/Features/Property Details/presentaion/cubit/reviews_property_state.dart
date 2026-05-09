part of 'reviews_property_cubit.dart';

@immutable
sealed class ReviewsPropertyState {}

final class ReviewsPropertyInitial extends ReviewsPropertyState {}

final class ReviewsPropertyLoading extends ReviewsPropertyState {}

final class ReviewsPropertyLoaded extends ReviewsPropertyState {
  final List<UserReviewEnitity> reviews;
  ReviewsPropertyLoaded( this.reviews);
}

final class ReviewsPropertyError extends ReviewsPropertyState {
  final String message;
  ReviewsPropertyError(this.message);
}
