import 'package:real_estate3_a/Features/Property%20Details/domin/entities/property/user.details.entity.dart';

import '../../../data/models/user/user.review.model.dart';

class UserReviewEnitity {
  int? id;
  int? rating;
  String? comment;
  DateTime? createdAt;
  UserEntity? user;

  UserReviewEnitity({this.id, this.rating, this.comment, this.createdAt, this.user});

  factory UserReviewEnitity.fromModel(
    UserReviewMode json,
  ) {
    return UserReviewEnitity(
      id: json.id,
      rating: json.rating,
      comment: json.comment,
      createdAt: json.createdAt,
      user: json.user == null
          ? null
          : UserEntity.fromModel(json.user!),
    );
  }

  // Map<String, dynamic>
  // toId13Rating5CommentGreatPlaceCreatedAt20260505T144125000000ZUserId2NameJohnUpdatedEmailBuyerExampleComRoleAgentLocationCairoPhone201000000000CreatedAt20260503T133011000000ZImageHttpsWwwGravatarComAvatarC8d3adca922f6037a02ffe71617aa302DIdenticonS200() {
  //   return {
  //     'id': id,
  //     'rating': rating,
  //     'comment': comment,
  //     'created_at': createdAt?.toIso8601String(),
  //     'user': user
  //         ?.toId13Rating5CommentGreatPlaceCreatedAt20260505T144125000000ZUserId2NameJohnUpdatedEmailBuyerExampleComRoleAgentLocationCairoPhone201000000000CreatedAt20260503T133011000000ZImageHttpsWwwGravatarComAvatarC8d3adca922f6037a02ffe71617aa302DIdenticonS200(),
  //   };
  // }
}
