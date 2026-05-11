class Image {
  int? id;
  String? url;
  int? sortOrder;

  Image({this.id, this.url, this.sortOrder});

  factory Image.fromJson(
    Map<String, dynamic> json,
  ) {
    return Image(
      id: json['id'] as int?,
      url: json['url'] as String?,
      sortOrder: json['sort_order'] as int?,
    );
  }

  Map<String, dynamic>
  toJson() {
    return {'id': id, 'url': url, 'sort_order': sortOrder};
  }
}
