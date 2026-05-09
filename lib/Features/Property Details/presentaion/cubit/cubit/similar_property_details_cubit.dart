import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:real_estate3_a/features/Property%20Details/domin/repos/propety_details_repo.dart';

import '../../../domin/entities/similar/similar.property.entity.dart';

part 'similar_property_details_state.dart';

class SimilarPropertyDetailsCubit extends Cubit<SimilarPropertyDetailsState> {
  SimilarPropertyDetailsCubit({required this.propertyDetailsRepo})
    : super(SimilarPropertyDetailsInitial());
  final PropertyDetailsRepo propertyDetailsRepo;
  Future<void> fetchSimilarPropertyDetails(int id) async {
    emit(SimilarPropertyDetailsLoading());
    final result = await propertyDetailsRepo.getPropertySimilars(id);
    result.fold(
      (l) => emit(SimilarPropertyDetailsFailure(l.message)),
      (r) => emit(SimilarPropertyDetailsLoaded(r)),
    );
  }
}
