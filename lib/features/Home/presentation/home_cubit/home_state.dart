part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeDataEntity homeData;

  // الـ lists دي بعد الـ search + filter
  final List<PropertyCardEntity> filteredBestSelling;
  final List<PropertyCardEntity> filteredFeatured;
  final List<PropertyCardEntity> filteredRecommended;

  // عشان الـ UI يعرف يعرض الـ active state
  final String searchQuery;
  final int selectedCategoryId;
  final String? selectedListingType;
  final double? minPrice;
  final double? maxPrice;

  const HomeLoaded({
    required this.homeData,
    required this.filteredBestSelling,
    required this.filteredFeatured,
    required this.filteredRecommended,
    required this.searchQuery,
    required this.selectedCategoryId,
    this.selectedListingType,
    this.minPrice,
    this.maxPrice,
  });

  bool get hasActiveFilter =>
      selectedListingType != null || minPrice != null || maxPrice != null;

  @override
  List<Object?> get props => [
    filteredBestSelling,
    filteredFeatured,
    filteredRecommended,
    searchQuery,
    selectedCategoryId,
    selectedListingType,
    minPrice,
    maxPrice,
  ];
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});
  @override
  List<Object?> get props => [message];
}