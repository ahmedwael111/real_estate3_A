import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/home_dateEntity.dart';
import '../../domain/entities/property_cardEntity.dart';
import '../../domain/repo/HomeRepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  HomeDataEntity? _rawData;

  String _searchQuery = '';
  int _selectedCategoryId = -1; // -1 = All
  String? _selectedListingType; // null | 'sale' | 'rent'
  double? _minPrice;
  double? _maxPrice;

  String get searchQuery => _searchQuery;
  int get selectedCategoryId => _selectedCategoryId;
  String? get selectedListingType => _selectedListingType;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;
  bool get hasActiveFilter =>
      _selectedListingType != null || _minPrice != null || _maxPrice != null;

  // ── Fetch ─────────────────────────────────────────────────────────────────
  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await _homeRepository.getHomeData();
    result.fold(
          (failure) => emit(HomeError(message: failure.message)),
          (data) {
        _rawData = data;
        _emitFiltered();
      },
    );
  }


  // ── Search ────────────────────────────────────────────────────────────────
  void onSearchChanged(String query) {
    _searchQuery = query.trim().toLowerCase();
    _emitFiltered();
  }

  // ── Category ──────────────────────────────────────────────────────────────
  void onCategorySelected(int categoryId) {
    _selectedCategoryId = categoryId; // -1 = All
    _emitFiltered();
  }
  // ── Filter ────────────────────────────────────────────────────────────────
  void applyFilter({
    String? listingType,
    double? minPrice,
    double? maxPrice,
  }) {
    _selectedListingType = listingType;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _emitFiltered();
  }

  void clearFilter() {
    _selectedListingType = null;
    _minPrice = null;
    _maxPrice = null;
    _emitFiltered();
  }

  // ── Core ──────────────────────────────────────────────────────────────────
  void _emitFiltered() {
    if (_rawData == null) return;
    emit(HomeLoaded(
      homeData: _rawData!,
      filteredBestSelling: _applyFilters(_rawData!.bestSelling),
      filteredFeatured: _applyFilters(_rawData!.featured),
      filteredRecommended: _applyFilters(_rawData!.recommended),
      searchQuery: _searchQuery,
      selectedCategoryId: _selectedCategoryId,
      selectedListingType: _selectedListingType,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
    ));
  }

  List<PropertyCardEntity> _applyFilters(List<PropertyCardEntity> items) {
    return items.where((p) {
      if (_searchQuery.isNotEmpty) {
        final hit = p.title.toLowerCase().contains(_searchQuery) ||
            p.address.toLowerCase().contains(_searchQuery) ||
            p.category.name.toLowerCase().contains(_searchQuery);
        if (!hit) return false;
      }
      if (_selectedCategoryId != -1 && p.category.id != _selectedCategoryId) {
        return false;
      }
      if (_selectedListingType != null) {
        final wantRent = _selectedListingType == 'rent';
        if (wantRent && p.listingType != ListingType.rent) return false;
        if (!wantRent && p.listingType != ListingType.sale) return false;
      }
      if (_minPrice != null && p.price < _minPrice!) return false;
      if (_maxPrice != null && p.price > _maxPrice!) return false;
      return true;
    }).toList();
  }
}