class Posts {
  String quote;
  String festival_name;
  String image;

  Posts(
      {required this.festival_name, required this.quote, required this.image});

  factory Posts.fromMap({required Map Data}) {
    return Posts(
      festival_name: Data['festival_name'],
      quote: Data['quote'],
      image: Data['festival_image'],
    );
  }
}
