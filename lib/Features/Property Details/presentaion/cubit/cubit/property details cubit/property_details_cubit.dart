import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate3_a/Features/Property%20Details/domin/entities/property/property.details.entity.dart';
import 'package:real_estate3_a/Features/Property%20Details/domin/repos/propety_details_repo.dart';

part 'property_details_state.dart';

class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
  PropertyDetailsCubit({required this.propertyDetailsRepo})
    : super(PropertyDetailsInitial());
  final PropertyDetailsRepo propertyDetailsRepo;
  Future<void> getPropertyDetails(int id) async {
    emit(PropertyDetailsLoading());
    final result = await propertyDetailsRepo.getPropertyDetails(id);
    result.fold(
      (l) => emit(PropertyDetailsFailure(l.message)),
      (r) => emit(PropertyDetailsSuccess(r)),
    );
  }
}
