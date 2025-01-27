class Book {
  final int id;
  final String title;
  final String author;
  final int rating;
  final bool isRead; // Updated field name

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.isRead, // Updated constructor parameter
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'rating': rating,
      'isRead': isRead ? 1 : 0, // Updated field name
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      rating: map['rating'],
      isRead: map['isRead'] == 1, // Updated field name
    );
  }
}
