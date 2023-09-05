class Blog {
  final int id;
  final String title;
  final String content;
  final String author;
  final String publicationDate;
  final String lastUpdatedDate;
  final List<String> tags;
  final String imageUrl;
  final int views;
  final int likes;
  final List<Map<String, String>> comments;
  final String status;
  final String urlSlug;
  final bool featured;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.publicationDate,
    required this.lastUpdatedDate,
    required this.tags,
    required this.imageUrl,
    required this.views,
    required this.likes,
    required this.comments,
    required this.status,
    required this.urlSlug,
    required this.featured,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      publicationDate: json['publicationDate'] as String,
      lastUpdatedDate: json['lastUpdatedDate'] as String,
      tags: List<String>.from(json['tags'] as List),
      imageUrl: json['imageUrl'] as String,
      views: json['views'] as int,
      likes: json['likes'] as int,
      comments: List<Map<String, String>>.from(json['comments'] as List),
      status: json['status'] as String,
      urlSlug: json['urlSlug'] as String,
      featured: json['featured'] as bool,
    );
  }
}
