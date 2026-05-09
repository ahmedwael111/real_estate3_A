import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:real_estate3_a/Features/Property%20Details/domin/repos/propety_details_repo.dart'
    show PropertyDetailsRepo;

import '../../domin/entities/user/user.reveiw.enitity.dart';


part 'reviews_property_state.dart';

class ReviewsPropertyCubit extends Cubit<ReviewsPropertyState> {
  ReviewsPropertyCubit({required this.propertyDetailsRepo})
    : super(ReviewsPropertyInitial());
  final PropertyDetailsRepo propertyDetailsRepo;
  Future<void> fetchReviewsProperty(int id) async {
    emit(ReviewsPropertyLoading());
    final result = await propertyDetailsRepo.getPropertyReviews(id);
    result.fold(
      (l) => emit(ReviewsPropertyError(l.message)),
      (r) => emit(ReviewsPropertyLoaded(r)),
    );
  }
}
