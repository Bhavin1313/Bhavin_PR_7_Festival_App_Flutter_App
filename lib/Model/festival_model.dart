class Posts {
  String quote;
  String festival_name;

  Posts({required this.festival_name, required this.quote});

  factory Posts.fromMap({required Map Data}) {
    return Posts(
      festival_name: Data['festival_name'],
      quote: Data['quote'],
    );
  }
}
