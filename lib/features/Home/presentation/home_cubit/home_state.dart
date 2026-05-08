part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

// في home_state.dart
class HomeLoaded extends HomeState {
  final HomeDataEntity homeData;
  final List<PropertyCardEntity> filteredBestSelling;
  final List<PropertyCardEntity> filteredFeatured;
  final List<PropertyCardEntity> filteredRecommended;
  final String searchQuery;
  final int selectedCategoryId;
  final String? selectedListingType;
  final double? minPrice;
  final double? maxPrice;

  // ✅ الجديد — كل النتائج في list واحدة لما يكون في search/filter
  final List<PropertyCardEntity> allFilteredResults;

  // ✅ هل في search أو filter active؟
  bool get isFiltering =>
      searchQuery.isNotEmpty ||
          selectedCategoryId != -1 ||
          selectedListingType != null ||
          minPrice != null ||
          maxPrice != null;

  bool get hasActiveFilter =>
      selectedListingType != null || minPrice != null || maxPrice != null;

  const HomeLoaded({
    required this.homeData,
    required this.filteredBestSelling,
    required this.filteredFeatured,
    required this.filteredRecommended,
    required this.allFilteredResults, // ✅
    required this.searchQuery,
    required this.selectedCategoryId,
    this.selectedListingType,
    this.minPrice,
    this.maxPrice,
  });

  @override
  List<Object?> get props => [
    filteredBestSelling,
    filteredFeatured,
    filteredRecommended,
    allFilteredResults,
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