import 'package:first_pj/features/blog/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.posterId,
    required super.title,
    required super.content,
    required super.imageUrl,
    required super.topics,
    required super.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': super.id,
      'poster_id': super.posterId,
      'title': super.title,
      'content': super.content,
      'image_url': super.imageUrl,
      'topics': super.topics,
      'updated_at': super.updatedAt.toIso8601String(),
    };
  }

  factory BlogModel.fromJson(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as String,
      posterId: map['poster_id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['image_url'] as String,
      topics: List<String>.from(map['topics'] ?? []),
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at'] as String),
    );
  }

  BlogModel copyWith({
    String? id,
    String? posterId,
    String? title,
    String? content,
    String? imageUrl,
    List<String>? topics,
    DateTime? updatedAt,
  }) {
    return BlogModel(
      id: id ?? super.id,
      posterId: posterId ?? super.posterId,
      title: title ?? super.title,
      content: content ?? super.content,
      imageUrl: imageUrl ?? super.imageUrl,
      topics: topics ?? super.topics,
      updatedAt: updatedAt ?? super.updatedAt,
    );
  }
}
