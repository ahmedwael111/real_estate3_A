class UserReviewMode {
  int? id;
  int? rating;
  String? comment;
  DateTime? createdAt;
  UserReviewMode? user;

  UserReviewMode({
    this.id,
    this.rating,
    this.comment,
    this.createdAt,
    this.user,
  });

  factory UserReviewMode.fromJson(Map<String, dynamic> json) {
    return UserReviewMode(
      id: json['id'] as int?,
      rating: json['rating'] as int?,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      user: json['user'] == null
          ? null
          : UserReviewMode.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt?.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}
