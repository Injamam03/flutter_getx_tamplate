class BookPage {
  final String imageAsset; // local এর জন্য
  final String? imageUrl;  // backend থেকে আসলে এটা use করবে

  BookPage({
    required this.imageAsset,
    this.imageUrl,
  });

  // ✅ Backend থেকে JSON এলে এই factory use করো
  factory BookPage.fromJson(Map<String, dynamic> json) {
    return BookPage(
      imageAsset: '',
      imageUrl: json['image_url'] as String?,
    );
  }
}