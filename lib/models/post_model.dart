class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String? userPhoto;
  final String content;
  final String mood;
  final List<String> topics;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhoto,
    required this.content,
    required this.mood,
    required this.topics,
    required this.createdAt,
    required this.likesCount,
    required this.commentsCount,
  });

  factory PostModel.fromFirestore(String id, Map<String, dynamic> data) {
    return PostModel(
      id: id,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? '',
      userPhoto: data['userPhoto'],
      content: data['content'] ?? '',
      mood: data['mood'] ?? 'neutral',
      topics: (data['topics'] as List? ?? []).cast<String>(),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      likesCount: data['likesCount'] ?? 0,
      commentsCount: data['commentsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhoto': userPhoto,
      'content': content,
      'mood': mood,
      'topics': topics,
      'createdAt': Timestamp.fromDate(createdAt),
      'likesCount': likesCount,
      'commentsCount': commentsCount,
    };
  }
}

class Timestamp {
  toDate() {}
  
  static fromDate(DateTime createdAt) {}
}