class Blog {
  int? id;
  String title = '';
  String author = '';
  String content = '';

  Blog({
    this.id,
    required this.title,
    required this.author,
    required this.content,
  });

  // map to note
  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] as int?,
      title: map['title'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
    );
  }

  // note to map
  Map<String, dynamic> toMap() {
    // Only include 'id' if it's not null (e.g., for updates)
    // For new inserts, we let the database handle it.
    final Map<String, dynamic> map = {
      'title': title,
      'author': author,
      'content': content,
    };
    if (id != null) {
      map['id'] =
          id; // Include id only if it exists (for updates or specific cases)
    }
    return map;
  }
}
